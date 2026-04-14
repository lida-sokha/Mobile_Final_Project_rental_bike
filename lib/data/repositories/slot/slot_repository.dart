import '../../../model/slot/slot.dart';

abstract class SlotRepository {
  Future<List<Slot>> getSlotsForStation(String stationId);
}