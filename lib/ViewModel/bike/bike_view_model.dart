import 'package:flutter/material.dart';
import '../../data/repositories/bike/bike_repository.dart';
import '../../model/bike/bike.dart';

class BikeViewModel extends ChangeNotifier {
  final BikeRepository repository;

  BikeViewModel(this.repository);

  List<Bike> bikes = [];
  bool isLoading = false;


  Future<void> loadBikes(List<Bike> bikeList) async {
    bikes = bikeList;
    notifyListeners();
  }


  Future<void> bookBike(String bikeId) async {
    try {
      isLoading = true;
      notifyListeners();

  
      await repository.bookBike(bikeId);

      bikes = bikes.map((bike) {
        if (bike.id == bikeId) {
          return Bike(
            id: bike.id,
            stationId: bike.stationId,
            isAvailable: false,
          );
        }
        return bike;
      }).toList();
    } catch (e) {
      debugPrint("Error booking bike: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
