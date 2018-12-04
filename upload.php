<?php

require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\IOFactory;

class DB
{
	var $con;
	function __construct()
	{
		$servername = "localhost";
		$username = "root";
		$password = "root";
		$database = "percobaan";
		$this->con = new mysqli($servername, $username, $password, $database);
	}
}

// function 

// $db = new DB;
$db = new mysqli("localhost", "root", "root", "percobaan");
$folder = "files";
if(isset($_POST)){
	$ext = ucfirst(end(explode('.',$_FILES['file-upload']['name'])));

	$file = $folder."/".$_FILES['file-upload']['name'];
	move_uploaded_file($_FILES['file-upload']['tmp_name'],$file);	
	$reader = IOFactory::createReader($ext);	
	$spreadsheet = $reader->load($file);
	$sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
	$i = 1;
	$err = 0;
	//Loop data excel
	foreach ($sheetData as $key => $v) {
		if($i == 1){
			$cols = implode(",",$v);
		}elseif($i > 1){
			$ins = $db->query("Insert into karyawan (".$cols.") values ('".implode("','",$v)."')");
		}
		$i++;
		$err++;
	}

	echo ($err - 1)." Data Inserted!";

}