<?php
$dbconnect = mysqli_connect("localhost", "root", "","employees_db");

if(!&dbconnect){
  die("Couldn't connect to MySQL database \n Connection Error:". mysqli_connect_error());
}

 ?>
