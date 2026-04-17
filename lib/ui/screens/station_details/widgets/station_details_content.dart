import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_bike/ui/utils/async_value.dart';

import '../view_model/station_details_view_model.dart';
import 'dock_list_item.dart';

class StationDetailContent extends StatelessWidget {
  const StationDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<StationDetailViewModel>();
    final state = viewModel.dockValue;

    switch (state.state) {
      case AsyncValueState.loading:
        return const Center(
          child: CircularProgressIndicator(color: Colors.green),
        );

      case AsyncValueState.error:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cloud_off, size: 60, color: Colors.redAccent),
                const SizedBox(height: 16),
                const Text(
                  "Oops! Something went wrong",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Error: ${state.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
                TextButton(
                  onPressed: () {
                    //book page
                  },
                  child: const Text("Try Again"),
                ),
              ],
            ),
          ),
        );

      case AsyncValueState.success:
        final items = state.data ?? [];

        if (items.isEmpty) {
          return const Center(
            child: Text("No docks are currently available at this station."),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 20,
            left: 8,
            right: 8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return DockListItem(item: items[index]);
          },
        );
    }
  }
}
