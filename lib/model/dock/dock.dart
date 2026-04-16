class Dock {
  final String id;
  final String dockNumber; 
  final String? bikeId; 

  Dock({required this.id, required this.dockNumber, this.bikeId});

  bool get isBusy => bikeId != null;
}
