<?php
require_once __DIR__ . '/_bootstrap.php';

const FOOD_IMG_FALLBACK = 'photo-1504674900247-0877df9cc836';

$restaurants = $pdo->query(
    "SELECT r.restaurant_id AS id, r.restaurant_name AS name, r.image_url, r.price_tier,
            r.rating, r.cuisines, r.description, r.hours, r.map_link,
            d.name AS location, d.destination_id
     FROM restaurants r
     JOIN destinations d ON d.destination_id = r.destination_id
     ORDER BY r.rating DESC, r.restaurant_name ASC"
)->fetchAll();

$items = [];
foreach ($restaurants as $r) {
    $cuisines = array_filter(array_map('trim', explode(',', (string) $r['cuisines'])));
    $items[] = [
        'id'           => (int) $r['id'],
        'name'         => $r['name'],
        'image'        => 'https://images.unsplash.com/' . ($r['image_url'] ?: FOOD_IMG_FALLBACK) . '?auto=format&fit=crop&w=800&q=60',
        'img_fallback' => 'https://images.unsplash.com/' . FOOD_IMG_FALLBACK . '?auto=format&fit=crop&w=800&q=60',
        'priceTier'    => $r['price_tier'],
        'rating'       => (float) $r['rating'],
        'cuisines'     => array_values($cuisines),
        'location'     => $r['location'],
        'destination_id' => (int) $r['destination_id'],
        'description'  => $r['description'],
        'hours'        => $r['hours'],
        'map_link'     => $r['map_link'],
    ];
}

$destinations = $pdo->query(
    "SELECT DISTINCT d.name FROM restaurants r JOIN destinations d ON d.destination_id = r.destination_id ORDER BY d.name"
)->fetchAll(PDO::FETCH_COLUMN);

$allCuisines = $pdo->query("SELECT cuisines FROM restaurants WHERE cuisines IS NOT NULL")->fetchAll(PDO::FETCH_COLUMN);
$cuisineSet = [];
foreach ($allCuisines as $row) {
    foreach (array_filter(array_map('trim', explode(',', $row))) as $c) {
        $cuisineSet[$c] = true;
    }
}
$cuisines = array_keys($cuisineSet);
sort($cuisines);

json_out([
    'items'        => $items,
    'total'        => count($items),
    'destinations' => $destinations,
    'cuisines'     => $cuisines,
    'priceTiers'   => ['$', '$$', '$$$'],
    'ratingOptions'=> ['4', '4.5'],
]);