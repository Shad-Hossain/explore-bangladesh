<?php
require_once __DIR__ . '/_bootstrap.php';

const FOOD_IMG_FALLBACK = 'photo-1504674900247-0877df9cc836';

$id = (int) ($_GET['id'] ?? 0);
if ($id <= 0) json_out(['error' => 'restaurant id required'], 422);

$stmt = $pdo->prepare(
    "SELECT r.restaurant_id AS id, r.restaurant_name AS name, r.image_url, r.price_tier,
            r.rating, r.cuisines, r.description, r.hours, r.map_link, r.address,
            d.name AS location, d.destination_id
     FROM restaurants r
     JOIN destinations d ON d.destination_id = r.destination_id
     WHERE r.restaurant_id = ?"
);
$stmt->execute([$id]);
$r = $stmt->fetch();
if (!$r) json_out(['error' => 'Restaurant not found.'], 404);

$menuStmt = $pdo->prepare(
    "SELECT f.food_item_id AS id, f.item_name AS name, f.suitable_weather,
            f.price, f.item_rating
     FROM food_items f WHERE f.restaurant_id = ? ORDER BY f.item_rating DESC, f.price DESC"
);
$menuStmt->execute([$id]);
$menu = $menuStmt->fetchAll();

$cuisines = array_values(array_filter(array_map('trim', explode(',', (string) $r['cuisines']))));

json_out([
    'id'            => (int) $r['id'],
    'name'          => $r['name'],
    'image'         => 'https://images.unsplash.com/' . ($r['image_url'] ?: FOOD_IMG_FALLBACK) . '?auto=format&fit=crop&w=1200&q=70',
    'img_fallback'  => 'https://images.unsplash.com/' . FOOD_IMG_FALLBACK . '?auto=format&fit=crop&w=1200&q=70',
    'priceTier'     => $r['price_tier'],
    'rating'        => (float) $r['rating'],
    'cuisines'      => $cuisines,
    'location'      => $r['location'],
    'destination_id'=> (int) $r['destination_id'],
    'description'   => $r['description'],
    'address'       => $r['address'],
    'hours'         => $r['hours'],
    'map_link'      => $r['map_link'],
    'menu'          => array_map(fn($m) => [
        'id'            => (int) $m['id'],
        'name'          => $m['name'],
        'suitable_weather' => $m['suitable_weather'],
        'price'         => (float) $m['price'],
        'item_rating'   => (float) $m['item_rating'],
    ], $menu),
]);