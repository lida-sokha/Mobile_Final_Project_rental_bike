import 'package:flutter/material.dart';
import '../../../model/bike/bike.dart';

class BookingSuccessScreen extends StatelessWidget {
  final Bike bike;
  final String dockNumber;  // ✅ FIXED: Parameter Added
  final String stationName; // ✅ FIXED: Parameter Added

  const BookingSuccessScreen({
    super.key,
    required this.bike,
    required this.dockNumber,  // ✅ FIXED: Constructor updated
    required this.stationName, // ✅ FIXED: Constructor updated
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back, color: Colors.black, size: 18),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Book a Bike", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            Container(
              width: 100, height: 100,
              decoration: BoxDecoration(color: Colors.green[100], shape: BoxShape.circle),
              child: Center(
                child: Container(
                  width: 76, height: 76,
                  decoration: BoxDecoration(color: Colors.green[400], shape: BoxShape.circle),
                  child: const Icon(Icons.check_rounded, size: 42, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Bike Booked!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text("Your bike is reserved at Dock $dockNumber", style: TextStyle(fontSize: 14, color: Colors.grey[500])), // ✅ FIXED: Use dockNumber
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8EC),
                border: Border.all(color: Colors.orange.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _infoRow("Station", stationName), // ✅ FIXED: Use stationName
                  _divider(),
                  _infoRow("Dock", dockNumber),     // ✅ FIXED: Use dockNumber
                  _divider(),
                  _infoRow("Bike", "#${bike.id}"),
                  _divider(),
                  _infoRow("Status", bike.status),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[500],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.directions, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text("Get direction to station", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _divider() => Divider(color: Colors.orange.shade100, height: 1);
}