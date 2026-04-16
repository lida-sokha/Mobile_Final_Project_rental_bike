import '../../../model/dock/dock.dart';

abstract class DockRepository {
  Future<List<Dock>> getDocksByStationId(String stationId);
}
