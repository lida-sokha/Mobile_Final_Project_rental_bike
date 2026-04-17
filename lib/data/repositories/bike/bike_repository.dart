import '../../../model/bike/bike.dart';

abstract class BikeRepository {
  
  Future<List<Bike>> getAllBikes();

  Future<Bike?> getBikeById(String bikeId);
}
