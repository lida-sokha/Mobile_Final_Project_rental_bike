import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/async_value.dart';
import '../view_model/station_view_model.dart';
import 'map/station_map.dart';

class StationContent extends StatelessWidget {
  const StationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<StationViewModel>();
    final state = viewModel.stationValue;

    switch (state.state) {
      case AsyncValueState.loading:
        return const Center(child: CircularProgressIndicator());

      case AsyncValueState.error:
        return Center(
          child: Text(
            'Error: ${state.error}',
            style: const TextStyle(color: Colors.red),
          ),
        );

      case AsyncValueState.success:
        final stations = viewModel.filteredStations;

        if (stations.isEmpty) {
          return const Center(child: Text('No stations found.'));
        }

        return StationMap(stations: stations);
    }
  }
}
