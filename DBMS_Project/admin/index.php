<?php
include "../database.php";

$message = "";

if (isset($_GET['verify'])) {
    $id = intval($_GET['verify']);
    if (!$conn->query("UPDATE service_provider SET verification_status='Verified' WHERE provider_id=$id")) {
        $message = "Could not verify provider.";
    } else {
        $message = "Provider verified.";
    }
}

if (isset($_GET['confirm'])) {
    $id = intval($_GET['confirm']);
    if (!$conn->query("UPDATE booking SET status='Confirmed' WHERE booking_id=$id")) {
        $message = "Could not confirm booking.";
    } else {
        $message = "Booking confirmed.";
    }
}

if (isset($_GET['cancel'])) {
    $id = intval($_GET['cancel']);
    if (!$conn->query("UPDATE booking SET status='Cancelled' WHERE booking_id=$id")) {
        $message = "Could not cancel booking.";
    } else {
        $message = "Booking cancelled.";
    }
}

if (isset($_GET['delete_partner'])) {
    $id = intval($_GET['delete_partner']);
    if (!$conn->query("DELETE FROM partner WHERE partner_id=$id")) {
        $message = "Could not delete partner. It may be linked to an advertisement.";
    } else {
        $message = "Partner deleted.";
    }
}

if (isset($_GET['delete_ad'])) {
    $id = intval($_GET['delete_ad']);
    if (!$conn->query("DELETE FROM advertisement WHERE ad_id=$id")) {
        $message = "Could not delete advertisement.";
    } else {
        $message = "Advertisement deleted.";
    }
}

$providers = $conn->query("SELECT * FROM service_provider ORDER BY provider_id DESC");
$bookings = $conn->query("SELECT booking.*, service_provider.name FROM booking JOIN service_provider ON booking.provider_id=service_provider.provider_id ORDER BY booking.booking_id DESC");
$partners = $conn->query("SELECT * FROM partner ORDER BY partner_id DESC");
$ads = $conn->query("SELECT advertisement.*, partner.partner_name FROM advertisement JOIN partner ON advertisement.partner_id=partner.partner_id ORDER BY ad_id DESC");
?>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Admin Dashboard</title><link rel="stylesheet" href="../style.css"></head>
<body>
<nav class="navbar"><div class="container"><a class="logo" href="../index.php">HeritageConnect Admin</a><a href="../index.php">View Website</a></div></nav>
<main class="container">

<h1>Admin Dashboard</h1>
<?php if($message): ?><div class="success"><?= htmlspecialchars($message) ?></div><?php endif; ?>

<h2>1. Provider Verification</h2>
<?php while($p = $providers->fetch_assoc()): ?>
<div class="card">
<b><?= htmlspecialchars($p['name']) ?></b> — <?= htmlspecialchars($p['service_type']) ?>
<p>Status: <?= htmlspecialchars($p['verification_status']) ?></p>
<?php if($p['verification_status'] === 'Pending'): ?>
<a class="btn" href="?verify=<?= $p['provider_id'] ?>">Verify Provider</a>
<?php endif; ?>
</div>
<?php endwhile; ?>

<h2>2. Booking Management</h2>
<?php while($b = $bookings->fetch_assoc()): ?>
<div class="card">
<b>Booking #<?= $b['booking_id'] ?></b> — <?= htmlspecialchars($b['name']) ?>
<p><?= htmlspecialchars($b['booking_date']) ?> at <?= htmlspecialchars($b['start_time']) ?></p>
<p>Status: <?= htmlspecialchars($b['status']) ?></p>
<?php if($b['status'] === 'Pending'): ?>
<a class="btn" href="?confirm=<?= $b['booking_id'] ?>">Confirm</a>
<a class="btn secondary" href="?cancel=<?= $b['booking_id'] ?>">Cancel</a>
<?php endif; ?>
</div>
<?php endwhile; ?>

<h2>3. Add Partner</h2>
<div class="form-box">
<form action="partner_add.php" method="POST">
<label>Partner name</label><input name="partner_name" placeholder="Example: Heritage Grand Hotel" required>
<label>Category</label>
<select name="category" required>
<option value="Hotel">Hotel</option>
<option value="Restaurant">Restaurant</option>
<option value="Tour Company">Tour Company</option>
<option value="Shopping">Shopping</option>
<option value="Transport">Transport</option>
<option value="Other">Other</option>
</select>
<label>Description</label><textarea name="description" placeholder="Short description"></textarea>
<label>Discount (%)</label><input type="number" name="discount" min="0" max="100" value="0">
<label>Featured?</label><select name="featured"><option value="1">Yes</option><option value="0">No</option></select>
<button type="submit">Add Partner</button>
</form>
</div>

<h2>Partner List</h2>
<?php while($p = $partners->fetch_assoc()): ?>
<div class="card">
<b><?= htmlspecialchars($p['partner_name']) ?></b>
<p><?= htmlspecialchars($p['category']) ?> · <?= $p['discount'] ?>% discount</p>
<a class="btn secondary" href="?delete_partner=<?= $p['partner_id'] ?>" onclick="return confirm('Delete this partner?')">Delete</a>
</div>
<?php endwhile; ?>

<h2>4. Add Advertisement</h2>
<div class="form-box">
<form action="ad_add.php" method="POST">
<label>Partner</label>
<select name="partner_id" required>
<?php
$list = $conn->query("SELECT partner_id, partner_name FROM partner WHERE status='Active' ORDER BY partner_name");
if (!$list) {
    echo '<option value="">Could not load partners</option>';
} elseif ($list->num_rows === 0) {
    echo '<option value="">No active partners available</option>';
} else {
while($p = $list->fetch_assoc()):
?>
<option value="<?= $p['partner_id'] ?>"><?= htmlspecialchars($p['partner_name']) ?></option>
<?php endwhile; } ?>
</select>
<label>Ad title</label><input name="title" placeholder="Example: 15% Hotel Discount" required>
<label>Description</label><textarea name="description" placeholder="Explain the offer"></textarea>
<label>Start date</label><input type="date" name="start_date" required>
<label>End date</label><input type="date" name="end_date" required>
<button type="submit">Publish Advertisement</button>
</form>
</div>

<h2>Advertisement List</h2>
<?php while($a = $ads->fetch_assoc()): ?>
<div class="card">
<b><?= htmlspecialchars($a['title']) ?></b>
<p><?= htmlspecialchars($a['partner_name']) ?></p>
<p><?= htmlspecialchars($a['start_date']) ?> to <?= htmlspecialchars($a['end_date']) ?></p>
<a class="btn secondary" href="?delete_ad=<?= $a['ad_id'] ?>" onclick="return confirm('Delete this advertisement?')">Delete</a>
</div>
<?php endwhile; ?>

</main>
</body>
</html>