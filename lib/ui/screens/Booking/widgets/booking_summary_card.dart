import 'package:flutter/material.dart';
import '../../../../model/bike/bike.dart';

class BookingSummaryCard extends StatelessWidget {
  final Bike bike;
  final String stationName;
  final String dockNumber;

  const BookingSummaryCard({
    super.key,
    required this.bike,
    required this.stationName,
    required this.dockNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8EC),
        border: Border.all(color: Colors.orange.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _summaryRow("Station", stationName),
          _divider(),
          _summaryRow("Dock", dockNumber),
          _divider(),
          _summaryRow("Bike", "#${bike.id}"),
          _divider(),
          _summaryRow("Status", bike.status),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(color: Colors.orange.shade100, height: 1);
}
