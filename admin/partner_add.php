<?php
include "../database.php";

$name = trim($_POST['partner_name'] ?? '');
$category = $_POST['category'] ?? '';
$description = trim($_POST['description'] ?? '');
$discount = intval($_POST['discount'] ?? 0);
$featured = intval($_POST['featured'] ?? 0);

if ($name === '' || $category === '') { die('Partner name and category are required.'); }
$discount = max(0, min(100, $discount));
$featured = ($featured === 1) ? 1 : 0;

$stmt = $conn->prepare("INSERT INTO partner (partner_name, category, description, discount, featured, status) VALUES (?, ?, ?, ?, ?, 'Active')");
$stmt->bind_param("sssii", $name, $category, $description, $discount, $featured);
if (!$stmt->execute()) { die("Partner could not be added."); }

header("Location: index.php");
exit;
?>