import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rental_bike/data/dtos/station_dtos.dart';
import '../../../model/station/station.dart';
// Make sure to import your abstract class
import 'station_repository.dart';

// 1. Add 'implements StationRepository' here
class StationRepositoryFirebase implements StationRepository {
  final Uri stationUri = Uri.https(
    'rental-bike-18cfe-default-rtdb.asia-southeast1.firebasedatabase.app',
    'stations.json',
  );

  @override // 2. Use @override to indicate you are fulfilling the interface
  Future<List<Station>> getAllStations() async {
    try {
      final response = await http.get(stationUri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data == null) return [];

        // Firebase returns a List (Keys are 0, 1, 2...)
        if (data is List) {
          final List<Station> stations = [];
          for (int i = 0; i < data.length; i++) {
            if (data[i] != null) {
              stations.add(
                StationDto.fromJson(
                  i.toString(),
                  Map<String, dynamic>.from(data[i]),
                ),
              );
            }
          }
          return stations;
        }
        // Firebase returns a Map (Keys are specific IDs like 'st1')
        else {
          final Map<String, dynamic> mapData = data;
          return mapData.entries.map((entry) {
            return StationDto.fromJson(
              entry.key,
              Map<String, dynamic>.from(entry.value),
            );
          }).toList();
        }
      } else {
        throw Exception("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
