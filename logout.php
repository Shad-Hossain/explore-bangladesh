<?php require_once __DIR__ . '/config/site.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Logging out… — COMPASS</title>

<link rel="stylesheet" href="<?= BASE_URL ?>css/style.css?v=2">
</head>
<body>
<div class="container section"><p>Logging you out…</p></div>
<script src="<?= BASE_URL ?>js/api.js?v=6"></script>
<script>
apiPost('<?= BASE_URL ?>api/logout.php', {}).finally(() => {
  window.location.href = '<?= BASE_URL ?>index.php';
});
</script>
</body>
</html>
