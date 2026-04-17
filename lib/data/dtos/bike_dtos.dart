import '../../model/bike/bike.dart';

class BikeDto {
  static const String statusKey = 'status';

  static Bike fromJson(String id, Map<String, dynamic> json) {
    return Bike(
      id: id,
      status: json[statusKey] ?? 'unavailable',
    );
  }

  static Map<String, dynamic> toJson(Bike bike) {
    return {statusKey: bike.status};
  }
}
