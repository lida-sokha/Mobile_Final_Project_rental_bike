import 'package:flutter/material.dart';
import '../../../../model/bike/bike.dart';

class BookingBikeCard extends StatelessWidget {
  final Bike bike;
  final String dockNumber;

  const BookingBikeCard({
    super.key,
    required this.bike,
    required this.dockNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8EC),
        border: Border.all(color: Colors.orange.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.pedal_bike, color: Colors.orange[700]),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bike #${bike.id}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Dock $dockNumber",
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
