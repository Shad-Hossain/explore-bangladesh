<?php
require_once __DIR__ . '/config/db.php';
$pageTitle = 'Food & Dining';
$cuisinesPreview = $pdo->query(
    "SELECT DISTINCT TRIM(SUBSTRING_INDEX(r.cuisines, ',', 1)) c FROM restaurants r WHERE r.cuisines IS NOT NULL ORDER BY c"
)->fetchAll(PDO::FETCH_COLUMN);
$previewCuisines = implode(', ', array_map(fn($c) => htmlspecialchars($c), array_slice(array_filter($cuisinesPreview), 0, 8)));
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
  <div class="container" style="max-width:1240px;margin:0 auto;padding:0 20px;">
    <div class="cs-sec-head">
      <div>
        <span class="cs-eyebrow">Food &amp; dining</span>
        <h2 class="cs-title">Food &amp; Dining</h2>
        <p class="cs-sub">From street food to rooftop fine dining — filter by cuisine, price and rating.</p>
      </div>
    </div>

    <div class="food-layout">
      <!-- LEFT: filters panel -->
      <aside class="food-filters" aria-label="Filters">
        <h4>Filters</h4>
        <div class="field">
          <label for="fDest">Destination</label>
          <select id="fDest">
            <option value="">All destinations</option>
          </select>
        </div>
        <div class="field">
          <label for="fCuisine">Cuisine</label>
          <select id="fCuisine">
            <option value="">All cuisines</option>
          </select>
        </div>
        <div class="field">
          <label for="fPrice">Price</label>
          <select id="fPrice">
            <option value="">Any</option>
            <option value="$">$</option>
            <option value="$$">$$</option>
            <option value="$$$">$$$</option>
          </select>
        </div>
        <div class="field">
          <label for="fRating">Rating</label>
          <select id="fRating">
            <option value="">Any</option>
            <option value="4">4+</option>
            <option value="4.5">4.5+</option>
          </select>
        </div>
        <button type="button" class="btn btn-gradient btn-block" id="applyBtn">Apply</button>
        <button type="button" class="btn btn-outline btn-block" id="resetBtn" style="margin-top:8px;">Reset</button>
      </aside>

      <!-- RIGHT: results -->
      <div>
        <div class="food-count" id="foodCount">Loading dining options…</div>
        <div class="food-grid" id="foodGrid">
          <div class="food-empty"><span class="ic">🍽️</span>Loading…</div>
        </div>
      </div>
    </div>
  </div>
</section>

<?php include __DIR__ . '/includes/footer.php'; ?>

<script src="/explore-bangladesh-main/js/util.js"></script>
<script src="/explore-bangladesh-main/js/api.js"></script>
<script src="/explore-bangladesh-main/js/layout.js"></script>
<script>
const BASE = '/explore-bangladesh-main/';
let ALL_ITEMS = [];
let ALL_DESTS = [];
let ALL_CUISINES = [];

function starIcon(rating) { return '★★★★★'.slice(0, 5); }

function cardHtml(item) {
  const stars = starIcon(item.rating);
  const price = escapeHtml(item.priceTier || '$$');
  const ratingNum = item.rating ? Number(item.rating).toFixed(1) : '—';
  const cuisines = (item.cuisines || []).map(escapeHtml).join(', ');
  const loc = escapeHtml(item.location || '');
  const desc = escapeHtml(item.description || '');
  const hours = escapeHtml(item.hours || '');
  const detailUrl = BASE + 'restaurant.php?id=' + item.id;
  return `
    <article class="food-card">
      <a class="food-card-media" href="${detailUrl}" aria-label="${escapeHtml(item.name)} — view details">
        <img src="${item.image}" alt="${escapeHtml(item.name)}" loading="lazy"
             onerror="this.onerror=null;this.src='${item.img_fallback}';">
        <span class="food-price">${price}</span>
        <button class="fav-btn" data-dest-id="${item.destination_id}" aria-label="Favourite">🤍</button>
      </a>
      <div class="food-card-body">
        <div class="food-title-row">
          <a class="food-title" href="${detailUrl}">${escapeHtml(item.name)}</a>
          <span class="food-rating"><span class="stars">${stars}</span> ${ratingNum}</span>
        </div>
        <div class="food-tags">${cuisines}${loc ? ' · ' + loc : ''}</div>
        <p class="food-desc"><a class="food-desc-link" href="${detailUrl}">${desc}</a></p>
        <div class="food-meta">
          <span class="food-hours">🕒 ${hours}</span>
        </div>
      </div>
    </article>`;
}

function currentFilter() {
  return {
    dest: document.getElementById('fDest').value,
    cuisine: document.getElementById('fCuisine').value,
    price: document.getElementById('fPrice').value,
    rating: document.getElementById('fRating').value,
  };
}

function applyFilters() {
  const f = currentFilter();
  const thresh = parseFloat(f.rating) || 0;
  const list = ALL_ITEMS.filter(item => {
    if (f.dest && item.location !== f.dest) return false;
    if (f.cuisine && !(item.cuisines || []).includes(f.cuisine)) return false;
    if (f.price && item.priceTier !== f.price) return false;
    if (f.rating && item.rating < thresh) return false;
    return true;
  });
  renderResults(list);
}

function renderResults(list) {
  const grid = document.getElementById('foodGrid');
  const count = document.getElementById('foodCount');
  count.innerHTML = `<b>${list.length}</b> of ${ALL_ITEMS.length} dining options`;
  if (!list.length) {
    grid.innerHTML = `<div class="food-empty"><span class="ic">🍽️</span>No dining options match those filters.<br>Try widening your search or hit Reset.</div>`;
  } else {
    grid.innerHTML = list.map(cardHtml).join('');
  }
  document.dispatchEvent(new CustomEvent('content:rendered'));
}

function populateFilterOptions() {
  const destSel = document.getElementById('fDest');
  ALL_DESTS.forEach(d => {
    const o = document.createElement('option');
    o.value = d; o.textContent = d;
    destSel.appendChild(o);
  });
  const cuiSel = document.getElementById('fCuisine');
  ALL_CUISINES.forEach(c => {
    const o = document.createElement('option');
    o.value = c; o.textContent = c;
    cuiSel.appendChild(o);
  });
}

async function loadFood() {
  const data = await apiGet(BASE + 'api/food_list.php');
  ALL_ITEMS = data.items || [];
  ALL_DESTS = data.destinations || [];
  ALL_CUISINES = data.cuisines || [];
  const total = data.total || ALL_ITEMS.length;
  document.getElementById('foodCount').innerHTML = `<b>${total}</b> of ${total} dining options`;
  populateFilterOptions();
  renderResults(ALL_ITEMS);
}

document.getElementById('applyBtn').addEventListener('click', applyFilters);
document.getElementById('resetBtn').addEventListener('click', () => {
  document.getElementById('fDest').value = '';
  document.getElementById('fCuisine').value = '';
  document.getElementById('fPrice').value = '';
  document.getElementById('fRating').value = '';
  renderResults(ALL_ITEMS);
});

loadFood();
</script>
</body>
</html>