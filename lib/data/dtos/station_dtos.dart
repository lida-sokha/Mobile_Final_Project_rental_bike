import '../../model/station/station.dart';

class StationDto {
  static const String nameKey = 'name';
  static const String latKey = 'latitude';
  static const String longKey = 'longitude';
  static const String totalSlotsKey = 'totalSlots';
  static const String availableBikesKey = 'availableBikes';

  static Station fromJson(String id, Map<String, dynamic> json) {
    assert(json[nameKey] is String, 'Station name must be a String');
    assert(json[latKey] is num, 'Latitude must be a number');
    assert(json[longKey] is num, 'Longitude must be a number');

    return Station(
      id: id,
      name: json[nameKey] ?? 'Unknown',
      latitude: (json[latKey] as num).toDouble(),
      longitude: (json[longKey] as num).toDouble(),
      totalSlots: json[totalSlotsKey] as int? ?? 0,
      availableBikes: json[availableBikesKey] as int? ?? 0,
    );
  }

  static Map<String, dynamic> toJson(Station station) {
    return {
      'id': station.id,
      nameKey: station.name,
      latKey: station.latitude,
      longKey: station.longitude,
      totalSlotsKey: station.totalSlots,
      availableBikesKey: station.availableBikes,
    };
  }
}
