class Slot {
  final String id;
  final int slotNumber;
  final bool isbusy;
  final String? bikeId;

  Slot({
    required this.id,
    required this.slotNumber,
    required this.isbusy,
    this.bikeId,
  });
}
