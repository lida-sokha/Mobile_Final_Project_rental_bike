import 'package:flutter/material.dart';
import '../../../../data/repositories/bike/bike_repository.dart';

class BookingViewModel extends ChangeNotifier {
  final BikeRepository repository;

  bool isLoading = false;

  BookingViewModel(this.repository);

  Future<void> bookBike(String bikeId) async {
    try {
      isLoading = true;
      notifyListeners();

      await repository.bookBike(bikeId);
    } catch (e) {
      debugPrint("Booking error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

