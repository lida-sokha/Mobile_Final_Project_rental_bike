import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/bike/bike.dart';
import '../../dtos/bike_dtos.dart'; 
import 'bike_repository.dart';

 class BikeRepositoryFirebase implements BikeRepository {
  final Uri bikesUri = Uri.https(
    'rental-bike-18cfe-default-rtdb.asia-southeast1.firebasedatabase.app',
    'Bikes.json',
  );

  @override
  Future<List<Bike>> getAllBikes() async {
    try {
      final response = await http.get(bikesUri);
      if (response.statusCode != 200 || response.body == 'null') return [];

      final Map<String, dynamic> data = json.decode(response.body);
      return data.entries.map((entry) {
        return BikeDto.fromJson(
          entry.key,
          Map<String, dynamic>.from(entry.value),
        );
      }).toList();
    } catch (e) {
      throw Exception("Failed to fetch bikes: $e");
    }
  }

  @override
  Future<Bike?> getBikeById(String bikeId) async {
    final Uri singleBikeUri = Uri.https(
      'rental-bike-18cfe-default-rtdb.asia-southeast1.firebasedatabase.app',
      'Bikes/$bikeId.json',
    );

    try {
      final response = await http.get(singleBikeUri);
      if (response.statusCode == 200 && response.body != 'null') {
        return BikeDto.fromJson(bikeId, json.decode(response.body));
      }
      return null;
    } catch (e) {
      return null;
    }
  }
  //booking
  @override
  Future<void> bookBike(String bikeId) async {
    final Uri updateUri = Uri.https(
      'rental-bike-18cfe-default-rtdb.asia-southeast1.firebasedatabase.app',
      'Bikes/$bikeId.json',
    );

    try {
      final response = await http.patch(
        updateUri,
        body: json.encode({'status': 'booked'}),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to book bike");
      }
    } catch (e) {
      throw Exception("Booking error: $e");
    }
  }
}
