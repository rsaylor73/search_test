<?php
// same info as index.php
session_start();
include "include/mysql.php";
include "class/store.class.php";
$store = new store($linkID);

// This is where the jquery request gets executed and executes the do_search method in the class. If nothing is passed to search.php then the error method is called.
if ($_GET['search_string'] != "") {
	$store->do_search();
} else {
	$store->error('You accessed this incorrectly.');
}
?>
