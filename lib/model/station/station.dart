import '../dock/dock.dart';
import '../bike/bike.dart';

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
  int get availableBikes => docks.where((d) => d.isBusy).length; //raw data
  int get emptySlots => totalSlots - availableBikes;
  
  //for the real data
  int getRealAvailableBikes(List<Bike> allBikes) {
    if (allBikes.isEmpty) return availableBikes; 
    
    return docks.where((dock) {
      if (!dock.isBusy) return false;
      final bike = allBikes.firstWhere(
          (b) => b.id == dock.bikeId, 
          orElse: () => Bike(id: dock.bikeId ?? '', status: 'unknown')
      );
      return bike.status == 'available';
    }).length;
  }
}
