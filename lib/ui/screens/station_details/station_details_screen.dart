import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_bike/ui/screens/station_details/view_model/station_details_view_model.dart';
import 'package:rental_bike/ui/screens/station_details/widgets/station_details_content.dart';
import 'package:rental_bike/ui/screens/station_details/widgets/station_header_info.dart';
import '../../../../model/station/station.dart';

class StationDetailsScreen extends StatefulWidget {
  final Station station;

  const StationDetailsScreen({super.key, required this.station});

  @override
  State<StationDetailsScreen> createState() => _StationDetailsScreenState();
}

class _StationDetailsScreenState extends State<StationDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Load the fresh data as soon as the screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StationDetailViewModel>().loadStationDetails(widget.station);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          StationHeader(station: widget.station),
          const Expanded(child: StationDetailContent()),
        ],
      ),
    );
  }
}
