<?php
include "database.php";
$id=intval($_GET['id'] ?? 0);
$stmt=$conn->prepare("SELECT * FROM service_provider WHERE provider_id=? AND verification_status='Verified'");
$stmt->bind_param("i",$id); $stmt->execute(); $provider=$stmt->get_result()->fetch_assoc();
if(!$provider) die("This service provider is not available.");
$message='';
if($_SERVER['REQUEST_METHOD']==='POST'){
  $date=$_POST['booking_date']??''; $time=$_POST['start_time']??'';
  $customer_name=trim($_POST['customer_name']??''); $customer_email=trim($_POST['customer_email']??'');
  if(!$date||!$time||!$customer_name||!filter_var($customer_email,FILTER_VALIDATE_EMAIL)) $message="Please fill all fields correctly.";
  elseif($date<date('Y-m-d')) $message="Booking date cannot be in the past.";
  else {
    $uid=1; $u=$conn->prepare("SELECT user_id FROM users WHERE user_id=?"); $u->bind_param("i",$uid); $u->execute();
    if(!$u->get_result()->num_rows){$ins=$conn->prepare("INSERT INTO users(name,email) VALUES(?,?)");$ins->bind_param("ss",$customer_name,$customer_email);$ins->execute();$uid=$conn->insert_id;}
    else {$up=$conn->prepare("UPDATE users SET name=?,email=? WHERE user_id=?");$up->bind_param("ssi",$customer_name,$customer_email,$uid);$up->execute();}
    $b=$conn->prepare("INSERT INTO booking(user_id,provider_id,booking_date,start_time) VALUES(?,?,?,?)");
    $b->bind_param("iiss",$uid,$id,$date,$time);
    if($b->execute()) header("Location: booking_success.php"); else $message="Booking could not be saved.";
    exit;
  }
}
?>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Book Service</title><link rel="stylesheet" href="style.css"></head>
<body><nav class="navbar"><div class="container"><a class="logo" href="services.php">HeritageConnect</a><div><a href="/explore-bangladesh-main/index.php">← COMPASS</a></div></div></nav><main class="container"><div class="form-box"><h2>Book <?=htmlspecialchars($provider['name'])?></h2><p><b><?=htmlspecialchars($provider['service_type'])?></b> · <?=htmlspecialchars($provider['languages'])?></p><p>Price: <b><?=number_format($provider['price'],2)?> BDT</b></p>
<?php if($message): ?><div class="notice"><?=htmlspecialchars($message)?></div><?php endif; ?>
<form method="POST"><label>Your name</label><input name="customer_name" required><label>Your email</label><input type="email" name="customer_email" required><label>Booking date</label><input type="date" name="booking_date" min="<?=date('Y-m-d')?>" required><label>Start time</label><input type="time" name="start_time" required><button>Submit Booking</button> <a class="btn secondary" href="services.php">Back</a></form></div></main></body></html>