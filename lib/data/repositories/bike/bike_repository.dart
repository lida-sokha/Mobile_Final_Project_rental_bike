import '../../../model/bike/bike.dart';

abstract class BikeRepository {
  Future<Bike?> getBikeDetails(String bikeId);
}
