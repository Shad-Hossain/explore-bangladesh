<?php
require_once __DIR__ . '/_bootstrap.php';

$ICONS = [
    'Bus'    => '🚌',
    'Car'    => '🚗',
    'Launch' => '🚤',
    'Flight' => '✈️',
    'Train'  => '🚆',
    'Bike'   => '🏍️',
];

$rows = $pdo->query(
    "SELECT r.route_id AS id,
            t.transport_type AS type,
            t.operator_name AS operator,
            r.origin,
            r.stop_over,
            d.name AS destination,
            r.departure_time,
            r.arrival_time,
            r.is_flexible,
            r.estimated_cost AS price,
            r.seats_available,
            r.estimated_time,
            r.schedule_info
     FROM transport_routes r
     JOIN transport t ON t.transport_id = r.transport_id
     JOIN destinations d ON d.destination_id = r.destination_id
     ORDER BY COALESCE(r.departure_time, '99:99'), r.route_id"
)->fetchAll();

$types = [];
$destinations = [];
$departures = [];

foreach ($rows as $r) {
    $departures[] = [
        'id'             => (int) $r['id'],
        'operator'       => $r['operator'],
        'type'           => $r['type'],
        'typeLabel'      => strtoupper($r['type']),
        'icon'           => $ICONS[$r['type']] ?? '🚌',
        'origin'         => $r['origin'],
        'stop_over'      => $r['stop_over'],
        'destination'    => $r['destination'],
        'departureTime'  => $r['departure_time'],
        'arrivalTime'    => $r['arrival_time'],
        'isFlexible'     => (int) $r['is_flexible'] === 1,
        'price'          => (float) $r['price'],
        'seatsAvailable' => (int) $r['seats_available'],
        'duration'       => $r['estimated_time'],
        'scheduleInfo'   => $r['schedule_info'],
    ];
    $types[$r['type']] = true;
    $destinations[$r['destination']] = true;
}

$typeList = array_map(function ($t) use ($ICONS) {
    return ['type' => $t, 'label' => $t, 'icon' => $ICONS[$t] ?? '🚌'];
}, array_keys($types));
sort($typeList);

json_out([
    'types'        => $typeList,
    'destinations' => array_values(array_diff(array_keys($destinations), [''])),
    'departures'   => $departures,
]);