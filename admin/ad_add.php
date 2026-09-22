<?php
include "../database.php";

$partner_id = intval($_POST['partner_id'] ?? 0);
$title = trim($_POST['title'] ?? '');
$description = trim($_POST['description'] ?? '');
$start_date = $_POST['start_date'] ?? '';
$end_date = $_POST['end_date'] ?? '';

if ($partner_id <= 0 || $title === '' || $start_date === '' || $end_date === '') { die('Partner, title, start date and end date are required.'); }
if ($end_date < $start_date) { die('End date cannot be before start date.'); }

$stmt = $conn->prepare("INSERT INTO advertisement (partner_id, title, description, start_date, end_date, status) VALUES (?, ?, ?, ?, ?, 'Active')");
$stmt->bind_param("issss", $partner_id, $title, $description, $start_date, $end_date);
if (!$stmt->execute()) { die("Advertisement could not be added."); }

header("Location: index.php");
exit;
?>