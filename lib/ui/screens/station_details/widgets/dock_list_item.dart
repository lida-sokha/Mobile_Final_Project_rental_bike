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
    final bool hasBike = item.isBusy && item.bike != null;
    final String? status = item.bike?.status;

    // ✅ LOGIC FIX: Strictly define states
    final bool isActuallyAvailable = hasBike && status == "available";
    final bool isAlreadyOccupied =
        hasBike && (status == "booked" || status == "in_use");

    return CustomListTile(
      backgroundColor: Colors.white,
      borderColor: isActuallyAvailable
          ? AppColors.labelgreen.withOpacity(0.3)
          : Colors.grey.shade300,
      title: "Dock ${item.dock.dockNumber}",
      subtitle: hasBike ? "Bike #${item.bike?.id}" : "Empty",
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActuallyAvailable
              ? Colors.green.shade50
              : Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(
          hasBike ? Icons.directions_bike : Icons.not_interested,
          color: isActuallyAvailable
              ? AppColors.labelgreen
              : Colors.grey.shade400,
          size: 24,
        ),
      ),
      trailing: hasBike
          ? CustomButton(
              // ✅ UI FIX: Change button text if the bike is in_use or booked
              text: isAlreadyOccupied ? "View" : "Unlock",
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => isAlreadyOccupied
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

                // Refresh the list and header when coming back
                if (context.mounted) {
                  context.read<StationDetailViewModel>().refresh();
                }
              },
            )
          : null,
    );
  }
}
