import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_bike/data/repositories/bike/bike_repository_firebase.dart';
import 'package:rental_bike/ui/screens/station_details/station_details_screen.dart';
import '../../../../model/station/station.dart';
import '../../../../model/bike/bike.dart';
import '../../../../model/dock_with_bike/dock_with_bike.dart';
import '../../../../data/repositories/bike/bike_repository.dart';
import '../../../utils/async_value.dart';

class StationDetailViewModel extends ChangeNotifier {
  final BikeRepository bikeRepository;

  // Stores the station info so the UI can access stationName
  Station? station;

  AsyncValue<List<DockWithBike>> dockValue = AsyncValue.loading();

  StationDetailViewModel({required this.bikeRepository});

  static Widget create({required Station station}) {
    return MultiProvider(
      providers: [
        Provider<BikeRepository>(create: (_) => BikeRepositoryFirebase()),
        ChangeNotifierProvider(
          create: (context) => StationDetailViewModel(
            bikeRepository: context.read<BikeRepository>(),
          )..loadStationDetails(station), // Auto-load data on creation
        ),
      ],
      child: StationDetailsScreen(station: station),
    );
  }

  Future<void> loadStationDetails(Station station) async {
    this.station = station; // Save station reference

    dockValue = AsyncValue.loading();
    notifyListeners();

    try {
      final allBikes = await bikeRepository.getAllBikes();

      final items = station.docks.map((dock) {
        final Bike? matchedBike = (dock.bikeId != null)
            ? allBikes.firstWhere(
                (b) => b.id == dock.bikeId,
                orElse: () => Bike(id: dock.bikeId!, status: 'unknown'),
              )
            : null;

        return DockWithBike(dock: dock, bike: matchedBike);
      }).toList();

      dockValue = AsyncValue.success(items);
    } catch (e) {
      dockValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  // Helper for the "Try Again" button in UI
  void refresh() {
    if (station != null) {
      loadStationDetails(station!);
    }
  }
}
