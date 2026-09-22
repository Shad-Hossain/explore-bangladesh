<?php
require_once __DIR__ . '/config/db.php';
$pageTitle = 'Transport';
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
<link rel="stylesheet" href="/explore-bangladesh-main/css/food.css">
<link rel="stylesheet" href="/explore-bangladesh-main/css/transport.css">
</head>
<body>

<?php include __DIR__ . '/includes/header.php'; ?>

<section class="cs-section">
  <div class="container" style="max-width:1240px;margin:0 auto;padding:0 20px;">
    <div class="cs-sec-head">
      <div>
        <span class="cs-eyebrow">Transport &amp; getting there</span>
        <h2 class="cs-title">Transport &amp; Getting There</h2>
        <p class="cs-sub">Compare buses, trains, rideshares and river ferries with live schedules and booked-seats info.</p>
      </div>
    </div>

    <div class="transport-layout">
      <!-- LEFT: filters panel -->
      <aside class="food-filters" aria-label="Filters">
        <h4>Filters</h4>
        <div class="field">
          <label for="tType">Type</label>
          <select id="tType">
            <option value="">All types</option>
          </select>
        </div>
        <div class="field">
          <label for="tSort">Sort by price</label>
          <select id="tSort">
            <option value="">Default</option>
            <option value="asc">Price: Low to High</option>
            <option value="desc">Price: High to Low</option>
          </select>
        </div>
        <div class="field">
          <label for="tDest">Destination</label>
          <select id="tDest">
            <option value="">All destinations</option>
          </select>
        </div>
        <button type="button" class="btn btn-gradient btn-block" id="tReset">Reset</button>
        <p class="transport-hint">Filters apply instantly.</p>
      </aside>

      <!-- RIGHT: results -->
      <div>
        <div class="food-count" id="tCount">Loading departures…</div>
        <div class="transport-grid" id="tGrid">
          <div class="food-empty"><span class="ic">🚌</span>Loading…</div>
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
let ALL_DEPARTURES = [];
let ALL_TYPES = [];
let ALL_DESTS = [];

function routeLabel(d) {
  const origin = escapeHtml(d.origin);
  const dest = escapeHtml(d.destination);
  return d.stop_over ? `${origin} → ${escapeHtml(d.stop_over)} → ${dest}` : `${origin} → ${dest}`;
}

function cardHtml(d) {
  const time = d.isFlexible
    ? `<div class="tr-time">Flexible</div><div class="tr-line"><span class="tr-dot"></span></div><div class="tr-time">Flexible</div>`
    : `<div class="tr-time"><b>${escapeHtml(d.departureTime || '—')}</b><span>Depart</span></div>
       <div class="tr-line"><span class="tr-dot"></span></div>
       <div class="tr-time"><b>${escapeHtml(d.arrivalTime || '—')}</b><span>Arrive</span></div>`;
  const dur = d.duration ? `<span class="tr-dur">${escapeHtml(d.duration)}</span>` : '';
  const bookHref = BASE + 'ticket_booking.php?route=' + d.id;
  return `
    <article class="transport-card">
      <div class="transport-top">
        <span class="transport-icon" aria-hidden="true">${d.icon}</span>
        <div>
          <h3 class="transport-name">${escapeHtml(d.operator)}</h3>
          <div class="transport-route">${d.typeLabel} · ${routeLabel(d)}</div>
        </div>
      </div>
      <div class="transport-timeline">${time}</div>
      <div class="transport-foot">
        <div class="transport-price-seats">
          <span class="transport-price">৳${Number(d.price).toLocaleString()}</span>
          <span class="transport-seats">${d.seatsAvailable} seats</span>
        </div>
        <a href="${bookHref}" class="transport-book">Book</a>
      </div>
      ${dur ? `<div class="transport-sched">${dur} · ${escapeHtml(d.scheduleInfo || '')}</div>` : ''}
    </article>`;
}

function currentFilters() {
  return {
    type: document.getElementById('tType').value,
    dest: document.getElementById('tDest').value,
    sort: document.getElementById('tSort').value,
  };
}

function applyFilters(silent) {
  const f = currentFilters();
  let list = ALL_DEPARTURES.filter(d => {
    if (f.type && d.type !== f.type) return false;
    if (f.dest && d.destination !== f.dest) return false;
    return true;
  });
  if (f.sort === 'asc') list = [...list].sort((a, b) => a.price - b.price);
  else if (f.sort === 'desc') list = [...list].sort((a, b) => b.price - a.price);
  renderResults(list);
}

function renderResults(list) {
  const grid = document.getElementById('tGrid');
  const count = document.getElementById('tCount');
  count.innerHTML = list.length === ALL_DEPARTURES.length
    ? `<b>${list.length}</b> departures found`
    : `<b>${list.length}</b> of ${ALL_DEPARTURES.length} departures found`;
  if (!list.length) {
    grid.innerHTML = `<div class="food-empty"><span class="ic">🚌</span>No departures match those filters.<br>Try a different type or destination, or hit Reset.</div>`;
  } else {
    grid.innerHTML = list.map(cardHtml).join('');
  }
}

function populateFilters() {
  const typeSel = document.getElementById('tType');
  ALL_TYPES.forEach(t => {
    const o = document.createElement('option');
    o.value = t.type; o.textContent = `${t.icon} ${t.label}`;
    typeSel.appendChild(o);
  });
  const destSel = document.getElementById('tDest');
  ALL_DESTS.forEach(dst => {
    const o = document.createElement('option');
    o.value = dst; o.textContent = dst;
    destSel.appendChild(o);
  });
}

// Live filtering — no Apply button
['tType', 'tSort', 'tDest'].forEach(id => {
  document.getElementById(id).addEventListener('change', () => applyFilters(false));
});
document.getElementById('tReset').addEventListener('click', () => {
  document.getElementById('tType').value = '';
  document.getElementById('tSort').value = '';
  document.getElementById('tDest').value = '';
  applyFilters(false);
});

async function loadTransport() {
  const data = await apiGet(BASE + 'api/transport_list.php');
  ALL_DEPARTURES = data.departures || [];
  ALL_TYPES = data.types || [];
  ALL_DESTS = data.destinations || [];
  document.getElementById('tCount').innerHTML = `<b>${ALL_DEPARTURES.length}</b> departures found`;
  populateFilters();
  renderResults(ALL_DEPARTURES);
  document.dispatchEvent(new CustomEvent('content:rendered'));
}

loadTransport();
</script>
</body>
</html>