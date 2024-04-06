import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'markers.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: const MapOptions(
        initialCenter: LatLng(59.423953179732045, 24.78625659251985),
        initialZoom: 13.0,
      ),
      children: <Widget>[
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(markers: markers),
      ],
    );
  }
}