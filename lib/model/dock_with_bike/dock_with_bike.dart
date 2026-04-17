import 'package:rental_bike/model/bike/bike.dart';
import 'package:rental_bike/model/dock/dock.dart';

class DockWithBike {
  final Dock dock;
  final Bike? bike;

  DockWithBike({required this.dock, required this.bike});

  bool get isBusy => bike != null;
}
