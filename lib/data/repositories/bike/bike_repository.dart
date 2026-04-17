import '../../../model/bike/bike.dart';

abstract class BikeRepository {
  Future<Bike?> getBikeById(String bikeId);

  // booking
  Future<void> bookBike(String bikeId);

  Future<List<Bike>>getAllBikes(); 
}
