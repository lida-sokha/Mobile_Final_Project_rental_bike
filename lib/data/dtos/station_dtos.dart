import '../../model/station/station.dart';
import '../../model/dock/dock.dart';

class StationDto {
  static const String nameKey = 'name';
  static const String latKey = 'latitude';
  static const String longKey = 'longitude';
  static const String docksKey = 'docks'; 

  static Station fromJson(String id, Map<String, dynamic> json) {
    List<Dock> parsedDocks = [];
    if (json[docksKey] != null) {
      final Map<String, dynamic> docksMap = Map<String, dynamic>.from(
        json[docksKey],
      );
      parsedDocks = docksMap.entries.map((entry) {
        final dockData = Map<String, dynamic>.from(entry.value);
        return Dock(
          id: entry.key,
          dockNumber: dockData['dockNumber'] ?? '',
          bikeId: dockData['bikeId'],
        );
      }).toList();
    }

    return Station(
      id: id,
      name: json[nameKey] ?? 'Unknown',
      latitude: (json[latKey] as num).toDouble(),
      longitude: (json[longKey] as num).toDouble(),
      docks: parsedDocks,
    );
  }
}
