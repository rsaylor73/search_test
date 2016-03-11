<?php
$DB_NAME = 'tek_store';
$DB_HOST = 'localhost';
$DB_USER = 'tek_store';
$DB_PASS = 'Haz*pV6R*]4M';


$linkID = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

if (mysqli_connect_errno()) {
   printf("Connect failed: %s\n", mysqli_connect_error());
   exit();
}
?>
