<?php
require_once __DIR__ . '/config/db.php';
$pageTitle = 'Restaurant';

$id = (int) ($_GET['id'] ?? 0);
if ($id <= 0) {
    header('Location: /explore-bangladesh-main/food.php');
    exit;
}

$rest = $pdo->prepare(
    "SELECT r.restaurant_id, r.restaurant_name, r.image_url, r.price_tier, r.rating,
            r.cuisines, r.description, r.hours, r.map_link, r.address,
            d.name AS location, d.destination_id
     FROM restaurants r JOIN destinations d ON d.destination_id = r.destination_id
     WHERE r.restaurant_id = ?"
);
$rest->execute([$id]);
$r = $rest->fetch();
if (!$r) {
    header('Location: /explore-bangladesh-main/food.php');
    exit;
}
$pageTitle = $r['restaurant_name'];

// Server-side snapshot of one menu item for SEO/no-JS; full menu loads via API.
$menu = $pdo->prepare(
    "SELECT item_name, suitable_weather, price, item_rating
     FROM food_items WHERE restaurant_id = ? ORDER BY item_rating DESC, price DESC LIMIT 6"
);
$menu->execute([$id]);
$menuItems = $menu->fetchAll();
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?= htmlspecialchars($pageTitle) ?> — COMPASS</title>
<script>
  (function () {
    try {
      var saved = localStorage.getItem('theme');
      var prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
      if (saved === 'dark' || (!saved && prefersDark)) {
        document.documentElement.setAttribute('data-theme', 'dark');
      }
    } catch (e) {}
  })();
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,400;9..144,600;9..144,700&family=Hind+Siliguri:wght@400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/explore-bangladesh-main/css/style.css?v=2">
<link rel="stylesheet" href="/explore-bangladesh-main/css/home.css">
<link rel="stylesheet" href="/explore-bangladesh-main/css/food.css">
</head>
<body>

<?php include __DIR__ . '/includes/header.php'; ?>

<section class="cs-section">
  <div class="container" style="max-width:1100px;margin:0 auto;padding:0 20px;">
    <a href="/explore-bangladesh-main/food.php" class="cs-viewall" style="display:inline-block;margin-bottom:18px;">← Back to Food &amp; Dining</a>

    <div class="rest-hero" style="display:grid; grid-template-columns:1fr 1.2fr; gap:26px; align-items:start;">
      <div class="rest-media" style="position:relative; border-radius:18px; overflow:hidden; box-shadow:var(--shadow-soft);">
        <img id="restImg" src="" alt="<?= htmlspecialchars($r['restaurant_name']) ?>" style="width:100%; height:340px; object-fit:cover; display:block;" onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1200&q=70';">
        <span class="food-price" style="position:absolute; top:12px; left:12px;"><?= htmlspecialchars($r['price_tier']) ?></span>
      </div>
      <div>
        <span class="cs-eyebrow">Restaurant</span>
        <h1 class="cs-title" style="font-size:clamp(1.6rem,3.5vw,2.1rem);"><?= htmlspecialchars($r['restaurant_name']) ?></h1>
        <div class="food-tags" style="font-size:.95rem; margin:6px 0 14px;">
          <?php
            $cuisines = array_filter(array_map('trim', explode(',', (string) $r['cuisines'])));
            echo htmlspecialchars(implode(', ', $cuisines));
          ?>
          · <?= htmlspecialchars($r['location']) ?>
        </div>
        <div class="food-rating" style="font-size:1rem; margin-bottom:14px;">
          <span class="stars">★★★★★</span>
          <span style="font-weight:800;"><?= number_format((float) $r['rating'], 1) ?></span>
          <span style="font-weight:400;color:var(--ink-soft);">/ 5.0</span>
        </div>
        <p class="food-desc" style="font-size:.95rem; color:var(--ink); -webkit-line-clamp:unset;"><?= htmlspecialchars($r['description']) ?></p>
        <div style="margin-top:16px; display:flex; flex-direction:column; gap:8px; font-size:.88rem; color:var(--ink-soft);">
          <div>📍 <?= htmlspecialchars($r['location']) ?><?= $r['address'] ? ' — ' . htmlspecialchars($r['address']) : '' ?></div>
          <div>🕒 <?= htmlspecialchars($r['hours']) ?></div>
        </div>
        <div style="display:flex; gap:10px; margin-top:20px; flex-wrap:wrap;">
          <a href="<?= htmlspecialchars($r['map_link']) ?>" target="_blank" rel="noopener" class="btn btn-forest">Get directions</a>
        </div>
      </div>
    </div>

    <section class="cs-section" style="margin-top:8px;">
      <div class="cs-sec-head">
        <div>
          <span class="cs-eyebrow">Menu</span>
          <h2 class="cs-title">Signature dishes</h2>
          <p class="cs-sub">Browsed from the food the restaurant is known for — pick one before you go.</p>
        </div>
      </div>
      <div class="menu-grid" id="menuGrid" style="display:grid; grid-template-columns:repeat(auto-fill,minmax(240px,1fr)); gap:18px;">
        <?php foreach ($menuItems as $m): ?>
          <article class="menu-card" style="background:var(--surface,#fff); border:1px solid var(--line-3); border-radius:14px; padding:14px; box-shadow:var(--shadow-card);">
            <div style="display:flex; justify-content:space-between; gap:10px;">
              <h3 style="font-size:.95rem; margin:0;"><?= htmlspecialchars($m['item_name']) ?></h3>
              <span style="white-space:nowrap; font-weight:800; color:var(--forest);">৳<?= number_format((float) $m['price']) ?></span>
            </div>
            <div style="font-size:.78rem; color:var(--ink-soft); margin-top:6px;">
              <?= htmlspecialchars($m['suitable_weather']) ?> weather · ⭐ <?= number_format((float) $m['item_rating'], 1) ?>
            </div>
          </article>
        <?php endforeach; ?>
      </div>
    </section>
  </div>
</section>

<?php include __DIR__ . '/includes/footer.php'; ?>

<script src="/explore-bangladesh-main/js/util.js"></script>
<script src="/explore-bangladesh-main/js/api.js"></script>
<script src="/explore-bangladesh-main/js/layout.js"></script>
<script>
const BASE = '/explore-bangladesh-main/';
const REST_ID = <?= (int) $id ?>;

function weatherIconCode(w) {
  const map = { Sunny: '☀️', Rainy: '🌧️', Cold: '🥶', Any: '⛅' };
  return map[w] || '⛅';
}

async function loadRestaurant() {
  const data = await apiGet(BASE + 'api/food_detail.php?id=' + REST_ID);
  if (data.error) {
    document.getElementById('menuGrid').innerHTML = '<div class="info-note">' + escapeHtml(data.error) + '</div>';
    return;
  }
  document.getElementById('restImg').src = data.image;
  document.getElementById('restImg').onerror = function () { this.onerror = null; this.src = data.img_fallback; };

  if (data.menu && data.menu.length) {
    document.getElementById('menuGrid').innerHTML = data.menu.map(m => `
      <article class="menu-card" style="background:var(--surface,#fff); border:1px solid var(--line-3); border-radius:14px; padding:14px; box-shadow:var(--shadow-card);">
        <div style="display:flex; justify-content:space-between; gap:10px;">
          <h3 style="font-size:.95rem; margin:0; flex:1;">${escapeHtml(m.name)}</h3>
          <span style="white-space:nowrap; font-weight:800; color:var(--forest);">৳${Number(m.price).toLocaleString()}</span>
        </div>
        <div style="font-size:.78rem; color:var(--ink-soft); margin-top:6px;">
          ${weatherIconCode(m.suitable_weather)} ${escapeHtml(m.suitable_weather)} weather · ⭐ ${Number(m.item_rating).toFixed(1)}
        </div>
      </article>`).join('');
  } else {
    document.getElementById('menuGrid').innerHTML = '<div class="info-note">Menu coming soon for this restaurant.</div>';
  }
  document.dispatchEvent(new CustomEvent('content:rendered'));
}

loadRestaurant();
</script>
</body>
</html>