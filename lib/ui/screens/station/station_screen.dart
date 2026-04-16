import 'package:flutter/material.dart';
import '../station/widgets/station_content.dart';
import 'widgets/search/station_searchbar.dart';

class StationScreen extends StatelessWidget {
  const StationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const StationContent(), 
          const SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: StationSearchBar(),
            ),
          ),
        ],
      ),
    );
  }
}
