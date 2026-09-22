<?php
$conn = new mysqli("localhost", "root", "", "heritage_db");

if ($conn->connect_error) {
    die("Database connection failed. Please check that MySQL is running and the database exists.");
}

$conn->set_charset("utf8mb4");
?>