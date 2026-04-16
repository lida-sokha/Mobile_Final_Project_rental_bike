import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_bike/data/repositories/station/station_repository.dart';

import 'data/repositories/station/station_repository_firebase.dart';
import './ui/screens/station/view_model/station_view_model.dart';
import 'main_common.dart';

List<InheritedProvider> get devProviders {
  final StationRepository stationRepository = StationRepositoryFirebase();

  return [
    //station
    Provider<StationRepository>(create: (_) => stationRepository),
    ChangeNotifierProvider<StationViewModel>(
      create: (context) => StationViewModel(
        stationRepository: context.read<StationRepository>(),
      ),
    ),
  ];
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(devProviders);
}
