import 'package:flutter/material.dart';
import 'package:rental_bike/ui/widgets/button/custom_button.dart';
import 'package:rental_bike/ui/widgets/list_tile/custom_list_tile.dart';
import '../../../../model/dock_with_bike/dock_with_bike.dart';
import '../../../theme/theme.dart';

class DockListItem extends StatelessWidget {
  final DockWithBike item;

  const DockListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final bool isBusy = item.isBusy;

    return CustomListTile(
      backgroundColor: isBusy ? AppColors.white : Colors.grey.shade500,
      borderColor: isBusy ? AppColors.labelgreen.withOpacity(0.3) : Colors.grey,

      titleColor: Colors.black,

      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isBusy ? Colors.green.shade50 : Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isBusy ? Icons.directions_bike : Icons.not_interested,
          color: isBusy ? AppColors.labelgreen : Colors.grey.shade400,
          size: 24,
        ),
      ),
      title: "Dock ${item.dock.dockNumber}",
      subtitle: isBusy ? "#${item.bike?.id}" : "Empty",

      trailing: isBusy
          ? CustomButton(text: "Unlock", onPressed: () => print("Unlocking..."))
          : null,
    );
  }
}
