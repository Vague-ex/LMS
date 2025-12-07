<?php
$dbconnect = mysqli_connect("localhost", "root", "", "library_db");

if (!$dbconnect) {
    die("Couldn't connect to MySQL database. Error: " . mysqli_connect_error());
}

/* recommended: set charset to avoid encoding issues */
mysqli_set_charset($dbconnect, 'utf8mb4');
?>
