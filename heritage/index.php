<?php
include "database.php";
$providers = $conn->query("SELECT * FROM service_provider WHERE verification_status='Verified' ORDER BY provider_id DESC");
$partners = $conn->query("SELECT * FROM partner WHERE status='Active' ORDER BY featured DESC, partner_name");
$ads = $conn->query("SELECT advertisement.*, partner.partner_name FROM advertisement JOIN partner ON advertisement.partner_id=partner.partner_id WHERE advertisement.status='Active' AND partner.status='Active' AND CURDATE() BETWEEN start_date AND end_date ORDER BY ad_id DESC");
?>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>HeritageConnect</title><link rel="stylesheet" href="style.css"></head>
<body>
<nav class="navbar"><div class="container"><a class="logo" href="index.php">HeritageConnect</a><div>
<a href="services.php">Guides & Services</a><a href="partners.php">Offers</a><a href="admin/login.php">Admin</a>
<a href="/explore-bangladesh-main/index.php">← COMPASS</a>
</div></div></nav>
<section class="hero"><div class="container"><h1>HeritageConnect</h1><p>Explore heritage places and find trusted guides, translators, security escorts and tourism offers.</p></div></section>
<main class="container">
<div class="card"><h2>Guides, Translators & Security Escorts</h2><p>Find verified service providers and book by date and time.</p><a class="btn" href="services.php">View Services</a></div>
<div class="card"><h2>Featured Offers</h2><p>Explore partner offers, discounts and advertisements.</p><a class="btn" href="partners.php">View Offers</a></div>
</main><footer>HeritageConnect &copy; 2026</footer></body></html>
