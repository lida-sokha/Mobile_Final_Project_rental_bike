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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_off, size: 60, color: Colors.redAccent),
              const SizedBox(height: 16),
              const Text(
                "Something went wrong",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () => viewModel.refresh(),
                child: const Text("Try Again"),
              ),
            ],
          ),
        );

      case AsyncValueState.success:
        final items = state.data ?? [];
        if (items.isEmpty)
          return const Center(child: Text("No docks available."));

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return DockListItem(
              item: items[index],
              stationName: viewModel.station?.name ?? "Unknown Station",
            );
          },
        );
    }
  }
}
