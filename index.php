<?php
// I am not using sessions but I usually do so this is cookie cutter item
session_start();

// I like to keep mysql details in a seperate file
include "include/mysql.php";

// calling my class
include "class/store.class.php";
$store = new store($linkID);

// displays the page
include "templates/header.phtml";
?>
