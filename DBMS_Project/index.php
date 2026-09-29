<?php
include "database.php";

$type = $_GET['type'] ?? '';
$language = $_GET['language'] ?? '';

$sql = "SELECT * FROM service_provider WHERE verification_status='Verified'";

if ($type !== '') {
    $type = $conn->real_escape_string($type);
    $sql .= " AND service_type='$type'";
}
if ($language !== '') {
    $language = $conn->real_escape_string($language);
    $sql .= " AND languages LIKE '%$language%'";
}

$providers = $conn->query($sql);
$partners = $conn->query("SELECT * FROM partner WHERE status='Active' ORDER BY featured DESC, partner_name");
$ads = $conn->query("SELECT advertisement.*, partner.partner_name FROM advertisement JOIN partner ON advertisement.partner_id=partner.partner_id WHERE advertisement.status='Active' AND partner.status='Active' AND CURDATE() BETWEEN start_date AND end_date ORDER BY ad_id DESC");
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HeritageConnect</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<nav class="navbar">
<div class="container">
<a class="logo" href="index.php">HeritageConnect</a>
<div>
<a href="#services">Services</a>
<a href="#offers">Offers</a>
<a href="my_bookings.php">My Bookings</a>
<a href="admin/index.php">Admin</a>
</div>
</div>
</nav>

<section class="hero">
<div class="container">
<h1>Explore Bangladesh with confidence.</h1>
<p>Find verified bilingual guides, translators and security escorts. Book trusted services and discover partner offers in one place.</p>
</div>
</section>

<main class="container">

<div class="search-box" id="services">
<h2>Find a Service</h2>
<form method="GET">
<div class="grid">
<div>
<label>Service</label>
<select name="type">
<option value="">All Services</option>
<option value="Guide">Guide</option>
<option value="Translator">Translator</option>
<option value="Security Escort">Security Escort</option>
</select>
</div>
<div>
<label>Language</label>
<input name="language" placeholder="Example: English">
</div>
</div>
<button type="submit">Search</button>
<a class="btn secondary" href="index.php">Clear</a>
</form>
</div>

<h2 class="section-title">Verified Service Providers</h2>
<div class="grid">
<?php while($p = $providers->fetch_assoc()): ?>
<div class="card">
<span class="badge">✓ Verified</span>
<h3><?= htmlspecialchars($p['name']) ?></h3>
<p><b><?= htmlspecialchars($p['service_type']) ?></b></p>
<p>Languages: <?= htmlspecialchars($p['languages']) ?></p>
<p>From <b><?= number_format($p['price'],2) ?> BDT</b></p>
<a class="btn" href="book.php?id=<?= $p['provider_id'] ?>">Book Now</a>
</div>
<?php endwhile; ?>
</div>

<h2 class="section-title" id="offers">Featured & Discount Partners</h2>
<div class="grid">
<?php while($p = $partners->fetch_assoc()): ?>
<div class="card">
<?php if($p['featured']): ?><span class="badge">★ Featured</span><?php endif; ?>
<h3><?= htmlspecialchars($p['partner_name']) ?></h3>
<p><?= htmlspecialchars($p['category']) ?></p>
<p><?= htmlspecialchars($p['description']) ?></p>
<?php if($p['discount'] > 0): ?><p class="discount"><?= $p['discount'] ?>% OFF</p><?php endif; ?>
</div>
<?php endwhile; ?>
</div>

<h2 class="section-title">Current Partner Offers</h2>
<div class="grid">
<?php while($ad = $ads->fetch_assoc()): ?>
<div class="card">
<span class="badge">Special Offer</span>
<h3><?= htmlspecialchars($ad['title']) ?></h3>
<p><b><?= htmlspecialchars($ad['partner_name']) ?></b></p>
<p><?= htmlspecialchars($ad['description']) ?></p>
</div>
<?php endwhile; ?>
</div>

</main>
<footer>HeritageConnect &copy; 2026</footer>
</body>
</html>