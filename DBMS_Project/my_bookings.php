<?php
include "database.php";
$success = isset($_GET['success']);

$sql = "SELECT booking.*, service_provider.name, service_provider.service_type
        FROM booking JOIN service_provider ON booking.provider_id=service_provider.provider_id
        WHERE booking.user_id=1 ORDER BY booking.booking_id DESC";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>My Bookings</title><link rel="stylesheet" href="style.css"></head>
<body>
<nav class="navbar"><div class="container"><a class="logo" href="index.php">HeritageConnect</a></div></nav>
<main class="container">
<h1>My Bookings</h1>
<?php if($success): ?><div class="success">Your booking has been submitted successfully.</div><?php endif; ?>
<?php while($b = $result->fetch_assoc()): ?>
<div class="card">
<h3><?= htmlspecialchars($b['name']) ?></h3>
<p><?= htmlspecialchars($b['service_type']) ?></p>
<p>Date: <?= htmlspecialchars($b['booking_date']) ?> · Time: <?= htmlspecialchars($b['start_time']) ?></p>
<p>Status: <b><?= htmlspecialchars($b['status']) ?></b></p>
</div>
<?php endwhile; ?>
<a class="btn" href="index.php">Find Another Service</a>
</main>
</body>
</html>