/**
 * Small shared helpers used across pages.
 * Client-side equivalent of the old includes/functions.php.
 */

// Work out the app's web root from where this script is served, so it adapts
// to any folder name. Result always has a leading and trailing slash
// (e.g. "/explore-bangladesh-main/" or "/").
window.BASE_URL = (function () {
  var scripts = document.getElementsByTagName('script');
  for (var i = 0; i < scripts.length; i++) {
    var src = scripts[i].src;
    if (src && /\/js\/util\.js($|\?)/.test(src)) {
      var base = src.replace(/\?.*$/, '').replace(/\/js\/util\.js$/, '');
      return /\/$/.test(base) ? base : base + '/';
    }
  }
  return '/';
})();

function escapeHtml(str) {
  if (str === null || str === undefined) return '';
  return String(str)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');
}

function truncateText(text, length = 100, suffix = '…') {
  if (!text) return '';
  return text.length > length ? text.slice(0, length) + suffix : text;
}

function money(n) {
  n = Number(n) || 0;
  return '৳' + n.toLocaleString('en-US');
}

function qs(name, fallback = '') {
  const params = new URLSearchParams(window.location.search);
  return params.has(name) ? params.get(name) : fallback;
}

function starString(rating) {
  const full = Math.round(Number(rating) || 0);
  return '★'.repeat(full) + '☆'.repeat(5 - full);
}
