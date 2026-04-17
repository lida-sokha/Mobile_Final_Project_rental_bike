import 'package:flutter/material.dart';
import '../../../../model/station/station.dart';
import '../../../../data/repositories/station/station_repository.dart';
import '../../../utils/async_value.dart';

class StationViewModel extends ChangeNotifier {
  final StationRepository stationRepository;

  AsyncValue<List<Station>> stationValue = AsyncValue.loading();

  StationViewModel({required this.stationRepository}) {
    _init();
  }

  void _init() async {
    getAllStations();
  }

  void getAllStations() async {
    stationValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Station> station = await stationRepository.getAllStations();
      stationValue = AsyncValue.success(station);
    } catch (e) {
      stationValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  String searchQuery = '';

  void updateSearchQuery(String query) {
    searchQuery = query.toLowerCase().replaceAll(' ', '');
    notifyListeners();
  }

  List<Station> get filteredStations {
    final allStations = stationValue.data ?? [];
    if (searchQuery.isEmpty) return allStations;

    return allStations.where((station) {
      final normalizedName = station.name.toLowerCase().replaceAll(' ', '');

      return normalizedName.contains(searchQuery);
    }).toList();
  }
}
