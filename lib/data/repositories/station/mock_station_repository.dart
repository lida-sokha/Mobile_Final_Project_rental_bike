import '../../../model/station/station.dart';
import 'station_repository.dart';

class MockStationRepository implements StationRepository {
  @override
  Future<List<Station>> getAllStations() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      // Station(
      //   id: "st1",
      //   name: "Koh Pich Station",
      //   latitude: 11.5564,
      //   longitude: 104.9282,
      //   totalSlots: 12,
      //   availableBikes: 9,
      // ),
      // Station(
      //   id: "st2",
      //   name: "Independence Monument Station",
      //   latitude: 11.5560,
      //   longitude: 104.9289,
      //   totalSlots: 10,
      //   availableBikes: 1,
      // ),
      // Station(
      //   id: "st3",
      //   name: "Central Market Station",
      //   latitude: 11.5696,
      //   longitude: 104.9210,
      //   totalSlots: 8,
      //   availableBikes: 0,
      // ),
      // Station(
      //   id: "st4",
      //   name: "Wat Phnom Station",
      //   latitude: 11.5763,
      //   longitude: 104.9282,
      //   totalSlots: 6,
      //   availableBikes: 3,
      // ),
      // Station(
      //   id: "st5",
      //   name: "Riverside Station",
      //   latitude: 11.5700,
      //   longitude: 104.9300,
      //   totalSlots: 15,
      //   availableBikes: 12,
      // ),
    ];
  }
}
