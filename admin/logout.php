<?php
require_once __DIR__ . '/../config/site.php';
session_start();
unset($_SESSION['admin_id'], $_SESSION['admin_username']);
header('Location: ' . BASE_URL . 'admin/login.php');
exit;
