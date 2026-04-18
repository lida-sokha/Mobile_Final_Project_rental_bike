import 'package:flutter/material.dart';
import '../../../model/bike/bike.dart';
import './widgets/booking_summary_card.dart'; 
import './widgets/booking_success_checkmark.dart'; 

class BookingSuccessScreen extends StatelessWidget {
  final Bike bike;
  final String dockNumber;
  final String stationName;

  const BookingSuccessScreen({
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
        leading: _buildBackButton(context),
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            const BookingSuccessCheckmark(),
            const SizedBox(height: 24),
            const Text(
              "Bike Booked!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "Your bike is reserved at Dock $dockNumber",
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
            const SizedBox(height: 28),

            // REUSED WIDGET: Same one used in BookingScreen
            BookingSummaryCard(
              bike: bike,
              stationName: stationName,
              dockNumber: dockNumber,
            ),

            const Spacer(),
            _buildDirectionButton(context),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      icon: CircleAvatar(
        backgroundColor: Colors.grey[200],
        radius: 15,
        child: const Icon(Icons.arrow_back, color: Colors.black, size: 18),
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  Widget _buildDirectionButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[500],
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => Navigator.pop(context),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              "Get direction to station",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
