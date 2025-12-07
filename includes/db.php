<?php
$dbconnect = mysqli_connect("localhost", "root", "", "library_db");

if (!$dbconnect) {
    die("Couldn't connect to MySQL database. Error: " . mysqli_connect_error());
}


mysqli_set_charset($dbconnect, 'utf8mb4');

function executeQuery($sql) {
    global $dbconnect;
    $result = mysqli_query($dbconnect, $sql);
    if (!$result) {
        die("Query failed: " . mysqli_error($dbconnect));
    }
    return $result;
}
?>