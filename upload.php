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
		$database = "n2";
		$this->con = new mysqli($servername, $username, $password, $database);
	}

	public function generateCode(){
		$code = 'AST0000001';
		$q = "SELECT code_asset from kmt_asset_inventory where id_shop=2388 and code_asset like 'AST%' group by code_asset order by code_asset DESC";
		//$q = "SELECT nama from karyawan where nama like 'AST%' group by nama order by nama DESC";
		$query = $this->con->query($q);
		if($query->num_rows > 0){
			$code = $query->fetch_row()[0];
			$a = intval(substr($code, 6)) + 1;
			$counter	= str_repeat('0', (7-strlen($a))).$a;
			$code = 'AST'.$counter;
		}

		return $code;
	}
}


set_time_limit(0);
$db = new DB;
$folder = "files";
if(isset($_POST)){
	$ext = ucfirst(end(explode('.',$_FILES['file-upload']['name'])));

	$file = $folder."/".$_FILES['file-upload']['name'];
	move_uploaded_file($_FILES['file-upload']['tmp_name'],$file);	
	$reader = IOFactory::createReader($ext);	
	$spreadsheet = $reader->load($file);
	$sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
	$inserted = 0;
	$x = 1;
	$cols = [];

	
	// Loop data excel
	foreach ($sheetData as $key => $v) {
		if($x == 1){
			unset($v['V']);
			$cols = implode(",",$v);
		}elseif($x > 1){
			$q = $db->generateCode();
			if($v['V'] > 1){
				$jml = $v['V'];
				unset($v['V']);
				for ($i=0; $i < $jml ; $i++) { 
					$v['B'] = $db->generateCode();
					$v['P'] = $v['B'];
					$db->con->query("Insert into kmt_asset_inventory (".$cols.") values ('".implode("','",$v)."')");
					$inserted++;
				}
				$inserted--;
			}
			unset($v['V']);
			$v['B'] = $db->generateCode();
			$v['P'] = $v['B'];
			$db->con->query("Insert into kmt_asset_inventory (".$cols.") values ('".implode("','",$v)."')");
		}
		$x++;
		$inserted++;
	}

	echo ($inserted - 1)." Data Inserted!";

}