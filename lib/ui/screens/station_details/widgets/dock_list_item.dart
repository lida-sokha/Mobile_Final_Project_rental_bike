import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_bike/ui/widgets/button/custom_button.dart';
import 'package:rental_bike/ui/widgets/list_tile/custom_list_tile.dart';
import '../../../../model/dock_with_bike/dock_with_bike.dart';
import '../../../theme/theme.dart';
import '../../Booking/booking_screen.dart';
import '../../Booking/booking_success_screen.dart';
import '../view_model/station_details_view_model.dart';

class DockListItem extends StatelessWidget {
  final DockWithBike item;
  final String stationName;

  const DockListItem({
    super.key,
    required this.item,
    required this.stationName,
  });

  @override
  Widget build(BuildContext context) {
    // 1. DATA EXTRACTION
    final bool hasBike = item.isBusy && item.bike != null;
    final String? status = item.bike?.status;

    // 2. STATE DEFINITIONS (For Conditional UI)
    final bool isAvailable = hasBike && status == "available";
    final bool isBooked = hasBike && status == "booked";
    final bool isInUse = hasBike && status == "in_use";

    return CustomListTile(
      backgroundColor: hasBike ? Colors.white : Colors.grey.shade500,
      borderColor: isAvailable
          ? AppColors.labelgreen.withOpacity(0.3)
          : Colors.grey.shade300,
      title: "Dock ${item.dock.dockNumber}",
      subtitle: !hasBike
          ? "Empty"
          : (isBooked
                ? "Reserved"
                : (isInUse ? "Currently on trip" : "Available")),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isAvailable ? Colors.green.shade50 : Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(
          hasBike ? Icons.directions_bike : Icons.not_interested,
          color: isAvailable ? AppColors.labelgreen : Colors.grey.shade400,
          size: 24,
        ),
      ),
      // 3. CONDITIONAL TRAILING UI
      trailing: hasBike
          ? (isInUse
                // If in_use, show only text (No Button)
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "In Use",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                // Otherwise, show the Action Button (Unlock or View)
                : CustomButton(
                    text: isBooked ? "View" : "Unlock",
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => isBooked
                              ? BookingSuccessScreen(
                                  bike: item.bike!,
                                  dockNumber: item.dock.dockNumber,
                                  stationName: stationName,
                                )
                              : BookingScreen(
                                  bike: item.bike!,
                                  dockNumber: item.dock.dockNumber,
                                  stationName: stationName,
                                ),
                        ),
                      );

                      // Refresh logic when returning
                      if (context.mounted) {
                        context.read<StationDetailViewModel>().refresh();
                      }
                    },
                  ))
          : null,
    );
  }
}
