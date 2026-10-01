<?php
require_once dirname(__DIR__) . '/config/site.php';
include "database.php";
$type = $_GET['type'] ?? '';
$language = $_GET['language'] ?? '';
$sql = "SELECT * FROM service_provider WHERE verification_status='Verified'";
if ($type !== '') { $stmt=$conn->prepare($sql." AND service_type=?"); $stmt->bind_param("s",$type); }
elseif ($language !== '') { $stmt=$conn->prepare($sql." AND languages LIKE ?"); $like="%".$language."%"; $stmt->bind_param("s",$like); }
else { $stmt=$conn->prepare($sql); }
$stmt->execute(); $providers=$stmt->get_result();
?>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Guides & Services</title><link rel="stylesheet" href="style.css"></head>
<body><nav class="navbar"><div class="container"><a class="logo" href="index.php">HeritageConnect</a><div><a href="services.php">Guides & Services</a><a href="partners.php">Offers</a><a href="admin/login.php">Admin Login</a><a href="<?= BASE_URL ?>index.php">← COMPASS</a></div></div></nav>
<main class="container">
<h1>Guides, Translators & Security Escorts</h1>
<div class="notice">Only service providers verified by the admin appear here. Booking records are private to the admin.</div>
<div class="search-box"><h2>Find a Service</h2><form method="GET"><div class="grid"><div><label>Service</label><select name="type"><option value="">All</option><option <?= $type==='Guide'?'selected':'' ?>>Guide</option><option <?= $type==='Translator'?'selected':'' ?>>Translator</option><option <?= $type==='Security Escort'?'selected':'' ?>>Security Escort</option></select></div><div><label>Language</label><input name="language" value="<?=htmlspecialchars($language)?>" placeholder="English, Bangla..."></div></div><button>Search</button> <a class="btn secondary" href="services.php">Clear</a></form></div>
<h2>Verified Providers</h2><div class="grid"><?php while($p=$providers->fetch_assoc()): ?><div class="card"><span class="badge">✓ Verified</span><h3><?=htmlspecialchars($p['name'])?></h3><p><b><?=htmlspecialchars($p['service_type'])?></b></p><p>Languages: <?=htmlspecialchars($p['languages'])?></p><p>Price: <b><?=number_format($p['price'],2)?> BDT</b></p><a class="btn" href="book.php?id=<?=$p['provider_id']?>">Book Now</a></div><?php endwhile; ?></div>
</main><footer>HeritageConnect</footer></body></html>