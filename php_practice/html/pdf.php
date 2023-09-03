<?php
if (!isset($_GET['pdf']) ){
    exit;
}
$file = "alice.pdf";
header('Content-Type: application/pdf');
readfile($file);
?>

