import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../helpers/date_formatter.dart';

class CIPMapComponents extends StatelessWidget {
  final double? lat;
  final double? lng;
  final int timeStamp;
  CIPMapComponents({Key? key, required this.lat, required this.lng, required this.timeStamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeAgo = timeAgoCustom(timeStamp);
    final circleMarkers = <CircleMarker>[
      CircleMarker(
          point: LatLng(lat ?? 0.0, lng ?? 0.0),
          color: Colors.blue.withOpacity(0.7),
          borderStrokeWidth: 5,
          useRadiusInMeter: true,
          radius: 15,
      ),
    ];

    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(lat ?? 0.0, lng ?? 0.0),
                  zoom: 18,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  CircleLayer(circles: circleMarkers),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 16.0,
          right: 16.0,
          child: Text('Last Updated $timeAgo'), //Icon
        ),
      ],
    );
  }
}
