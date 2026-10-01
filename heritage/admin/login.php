<?php
session_start(); include "../database.php";
if(isset($_SESSION['admin_id'])){header("Location: index.php");exit;}
$error='';
if($_SERVER['REQUEST_METHOD']==='POST'){
 $u=trim($_POST['username']??'');$p=$_POST['password']??'';
 $s=$conn->prepare("SELECT * FROM admin WHERE username=? LIMIT 1");$s->bind_param("s",$u);$s->execute();$a=$s->get_result()->fetch_assoc();
 if($a && password_verify($p,$a['password'])){session_regenerate_id(true);$_SESSION['admin_id']=$a['admin_id'];$_SESSION['admin_username']=$a['username'];header("Location: index.php");exit;}
 $error='Invalid admin username or password.';
}
?>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Admin Login</title><link rel="stylesheet" href="../style.css"></head><body><main class="container"><div class="form-box"><h1>Admin Login</h1><p>Private admin area. Only the single registered admin account can enter.</p><?php if($error):?><div class="notice"><?=htmlspecialchars($error)?></div><?php endif;?><form method="POST"><label>Username</label><input name="username" required><label>Password</label><input type="password" name="password" required><button>Login</button></form><p><a href="../index.php">Back to site</a></p></div></main></body></html>