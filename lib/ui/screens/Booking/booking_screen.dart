import 'package:flutter/material.dart';
import '../../../model/bike/bike.dart';
import 'widgets/booking_actions.dart';
import 'widgets/booking_section_title.dart';
import './widgets/booking_bike_card.dart';
import './widgets/booking_summary_card.dart';

class BookingScreen extends StatelessWidget {
  final Bike bike;
  final String dockNumber;
  final String stationName;

  const BookingScreen({
    super.key,
    required this.bike,
    required this.dockNumber,
    required this.stationName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 15,
            child: const Icon(Icons.arrow_back, color: Colors.black, size: 18),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Book a Bike",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BookingSectionTitle(title: "Your Selected Bike"),
            BookingBikeCard(bike: bike, dockNumber: dockNumber),
            const SizedBox(height: 16),
            const BookingSectionTitle(title: "Booking summary"),
            BookingSummaryCard(
              bike: bike,
              stationName: stationName,
              dockNumber: dockNumber,
            ),
            const Spacer(),
            BookingActions(
              bike: bike,
              dockNumber: dockNumber,
              stationName: stationName,
            ),
          ],
        ),
      ),
    );
  }
}
