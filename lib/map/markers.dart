import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

List<Marker> markers = [
  const Marker(
    width: 100.0,
    height: 100.0,
    point: LatLng(59.42217820003109, 24.790772053294166),
    child: Icon(Icons.location_on, color: Colors.yellow),

  ),
  const Marker(
    width: 100.0,
    height: 100.0,
    point: LatLng(59.42256748967516, 24.795051238536946),
    child: Icon(Icons.location_on, color: Colors.yellow),

  ),
  const Marker(
    width: 100.0,
    height: 100.0,
    point: LatLng(59.42481941516573, 24.778742347443043),
    child: Icon(Icons.location_on, color: Colors.yellow),
  ),
];
