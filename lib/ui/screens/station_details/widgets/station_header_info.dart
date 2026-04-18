import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_bike/ui/widgets/label_box/label_box.dart';
import '../../../../model/station/station.dart';
import '../../../../model/dock_with_bike/dock_with_bike.dart';
import '../../../theme/theme.dart';
import '../view_model/station_details_view_model.dart';

class StationHeader extends StatelessWidget {
  final Station station;

  const StationHeader({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    // Watch the ViewModel for real-time data updates
    final viewModel = context.watch<StationDetailViewModel>();
    final List<DockWithBike> items = viewModel.dockValue.data ?? [];

    //  LOGIC FIX: A bike is ONLY available if status is exactly 'available'
    // This ensures 'in_use' or 'booked' bikes are NOT counted here.
    final int availableCount = items.where((i) {
      return i.isBusy && i.bike?.status == "available";
    }).length;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.labelgreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        station.name,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Station #${station.id.substring(0, 3)} • 120m away",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: Row(
                children: [
                  Expanded(
                    child: LabelBox(
                      label: "Available",
                      value: availableCount.toString(),
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: LabelBox(
                      label: "Empty",
                      value: station.emptySlots.toString(),
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: LabelBox(
                      label: "Total docks",
                      value: station.totalSlots.toString(),
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
