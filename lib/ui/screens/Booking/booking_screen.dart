import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/bike/bike.dart';
import 'view_model/booking_view_model.dart';
import 'booking_success_screen.dart';

class BookingScreen extends StatelessWidget {
  final Bike bike;

  const BookingScreen({super.key, required this.bike});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BookingViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Book a Bike")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Bike Info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bike ${bike.id}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(bike.modelName),
                    ],
                  ),
                  const Chip(label: Text("Classic")),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Pass (static)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.credit_card),
                  SizedBox(width: 10),
                  Text("Monthly Pass - Active"),
                ],
              ),
            ),

            const Spacer(),

            // Confirm Button
            ElevatedButton(
              onPressed: bike.status == "available"
                  ? () async {
                      await vm.bookBike(bike.id);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookingSuccessScreen(bike: bike),
                        ),
                      );
                    }
                  : null,
              child: vm.isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Confirm Booking"),
            ),

            const SizedBox(height: 10),

            // Cancel
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ],
        ),
      ),
    );
  }
}
