import 'package:flutter/material.dart';
import '../../../../../model/station/station.dart';
import '../../../../theme/theme.dart';

class StationMarker extends StatelessWidget {
  final Station station;

  const StationMarker({super.key, required this.station});

  Color getStationColor(Station station) {
    if (station.availableBikes == 0) {
      return AppColors.redStation;
    } else if (station.availableBikes < 3) {
      return AppColors.orangeStation;
    } else {
      return AppColors.greenStation;
    }
  }

  bool hasAvailableBikes(Station station) {
    return station.availableBikes > 0;
  }

  @override
  Widget build(BuildContext context) {
    final Color statusColor = getStationColor(station);
    final bool hasBikes = hasAvailableBikes(station);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 6),
              Text(
                hasBikes ? '${station.availableBikes} bikes' : 'No bikes',
                style: AppTextStyles.stationLabel,
              ),
            ],
          ),
        ),
        Container(
          height: 20,
          width: 3,
          decoration: BoxDecoration(
            color: AppColors.darkText,
            borderRadius: BorderRadius.circular(1.5),
          ),
        ),
      ],
    );
  }
}
