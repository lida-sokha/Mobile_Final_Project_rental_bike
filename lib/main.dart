import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rental_bike/data/repositories/station/station_repository.dart';
import 'package:rental_bike/data/repositories/station/station_repository_firebase.dart';

import 'package:rental_bike/data/repositories/bike/bike_repository.dart';
import 'package:rental_bike/data/repositories/bike/bike_repository_firebase.dart';

import './ui/screens/station/view_model/station_view_model.dart';
import './ui/screens/Booking/view_model/booking_view_model.dart';

import 'main_common.dart';

List<InheritedProvider> get devProviders {
  final StationRepository stationRepository = StationRepositoryFirebase();
  final BikeRepository bikeRepository = BikeRepositoryFirebase(); //  ADD

  return [
    Provider<StationRepository>(create: (_) => stationRepository),
    Provider<BikeRepository>(create: (_) => bikeRepository),
    ChangeNotifierProvider<StationViewModel>(
      create: (context) => StationViewModel(
        stationRepository: context.read<StationRepository>(),
        bikeRepository: context.read<BikeRepository>(),
      ),
    ),

    ChangeNotifierProvider<BookingViewModel>(
      create: (context) => BookingViewModel(context.read<BikeRepository>()),
    ),
  ];
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(devProviders);
}
