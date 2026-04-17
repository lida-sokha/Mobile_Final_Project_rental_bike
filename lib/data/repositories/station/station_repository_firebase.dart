import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rental_bike/data/dtos/station_dtos.dart';
import '../../../model/station/station.dart';
import 'station_repository.dart';

class StationRepositoryFirebase implements StationRepository {
  final Uri stationUri = Uri.https(
    'rental-bike-18cfe-default-rtdb.asia-southeast1.firebasedatabase.app',
    'Stations.json',
  );

  @override
  Future<List<Station>> getAllStations() async {
    try {
      final response = await http.get(stationUri);

      if (response.statusCode != 200) {
        throw Exception("Server Error: ${response.statusCode}");
      }

      final data = json.decode(response.body);

      if (data == null) return [];

      final mapData = Map<String, dynamic>.from(data);

      return mapData.entries.map((entry) {
        return StationDto.fromJson(
          entry.key,
          Map<String, dynamic>.from(entry.value),
        );
      }).toList();
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
