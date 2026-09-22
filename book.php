<?php
include "database.php";

$id = intval($_GET['id'] ?? 0);
$result = $conn->query("SELECT * FROM service_provider WHERE provider_id=$id AND verification_status='Verified'");
if (!$result) { die("Could not load the service provider."); }
$provider = $result->fetch_assoc();

if (!$provider) die("This service provider is not available.");

$message = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $date = $_POST['booking_date'] ?? '';
    $time = $_POST['start_time'] ?? '';

    if ($date === '' || $time === '') {
        die('Please select a booking date and start time.');
    }
    if ($date < date('Y-m-d')) {
        die('Booking date cannot be in the past.');
    }
    $user_id = 1;

    $stmt = $conn->prepare("INSERT INTO booking (user_id, provider_id, booking_date, start_time) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("iiss", $user_id, $id, $date, $time);
    if (!$stmt->execute()) {
        die("Booking could not be saved. Please try again.");
    }

    header("Location: my_bookings.php?success=1");
    exit;
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Book Service</title><link rel="stylesheet" href="style.css"></head>
<body>
<nav class="navbar"><div class="container"><a class="logo" href="index.php">HeritageConnect</a></div></nav>
<main class="container">
<div class="form-box">
<h2>Book <?= htmlspecialchars($provider['name']) ?></h2>
<p><b><?= htmlspecialchars($provider['service_type']) ?></b> · <?= htmlspecialchars($provider['languages']) ?></p>
<p>Price: <b><?= number_format($provider['price'],2) ?> BDT</b></p>
<form method="POST">
<label>Booking date</label>
<input type="date" name="booking_date" min="<?= date('Y-m-d') ?>" required>
<label>Start time</label>
<input type="time" name="start_time" required>
<button type="submit">Confirm Booking</button>
<a class="btn secondary" href="index.php">Back</a>
</form>
</div>
</main>
</body>
</html>