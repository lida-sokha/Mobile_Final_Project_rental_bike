import 'package:flutter/material.dart';
import '../../../model/bike/bike.dart';

class BookingSuccessScreen extends StatelessWidget {
  final Bike bike;

  const BookingSuccessScreen({super.key, required this.bike});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book a Bike")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40),

            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(Icons.check, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 20),

            const Text(
              "Bike Booked!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text("Bike ${bike.id} reserved successfully"),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("Bike"), Text(bike.id)],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Status"), Text("Booked")],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "This bike is no longer available to other users",
              style: TextStyle(color: Colors.red),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Get direction to station"),
            ),
          ],
        ),
      ),
    );
  }
}
