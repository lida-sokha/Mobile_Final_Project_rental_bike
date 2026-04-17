import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rental_bike/ui/screens/station_details/view_model/station_details_view_model.dart';
import '../../../../../../model/station/station.dart';
import 'station_marker.dart';

class StationMap extends StatelessWidget {
  final List<Station> stations;

  const StationMap({super.key, required this.stations});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(11.5564, 104.9282), // Phnom Penh Center
        initialZoom: 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: stations.map((station) {
            return Marker(
              point: LatLng(station.latitude, station.longitude),
              width: 120,
              height: 70,
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          StationDetailViewModel.create(station: station),
                    ),
                  );
                },
                child: StationMarker(station: station),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
