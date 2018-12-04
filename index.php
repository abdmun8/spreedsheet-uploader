<?php

require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$spreadsheet = new Spreadsheet();

?>

<!DOCTYPE html>
<html>
<head>
	<title>Upload File PHP</title>
	<style type="text/css">
		* {
			margin: 5px;
		}

		body {
			
		}
	</style>
</head>
<body>
	<h3>Upload File to Table</h3>
	<form id="upload-form" method="post" action="upload.php" enctype="multipart/form-data">
		<input type="file" name="file-upload" id="file-upload" style="border:1px solid grey;padding: 10px;">
		<br>
	</form>
	<button onclick="upload()">Upload</button>
		
	<script>
		var form = document.getElementById("upload-form");		
		function upload(){
			form.submit();
		}
	</script>

</body>
</html>

