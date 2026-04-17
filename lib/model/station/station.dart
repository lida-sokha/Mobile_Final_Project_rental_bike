import '../dock/dock.dart';

class Station {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final List<Dock> docks;

  Station({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.docks,
  });

  int get totalSlots => docks.length;
  int get availableBikes => docks.where((d) => d.isBusy).length;
  int get emptySlots => totalSlots - availableBikes;
}
