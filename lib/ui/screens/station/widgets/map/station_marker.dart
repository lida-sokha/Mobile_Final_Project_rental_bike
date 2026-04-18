import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../model/station/station.dart';
import '../../../../../model/bike/bike.dart';
import '../../../../theme/theme.dart';
import '../../view_model/station_view_model.dart';

class StationMarker extends StatelessWidget {
  final Station station;

  const StationMarker({super.key, required this.station});

  int getRealAvailableBikes(BuildContext context, Station station) {
    final viewModel = context.watch<StationViewModel>();
    return station.getRealAvailableBikes(viewModel.allBikes);
  }

  Color getStationColor(int availableCount) {
    if (availableCount == 0) {
      return AppColors.redStation;
    } else if (availableCount < 3) {
      return AppColors.orangeStation;
    } else {
      return AppColors.greenStation;
    }
  }

  bool hasAvailableBikes(int availableCount) {
    return availableCount > 0;
  }

  @override
  Widget build(BuildContext context) {
    final int availableCount = getRealAvailableBikes(context, station);
    final Color statusColor = getStationColor(availableCount);
    final bool hasBikes = hasAvailableBikes(availableCount);

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
                hasBikes ? '$availableCount bikes' : 'No bikes',
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
