import 'package:flutter/material.dart';

class BookingSuccessCheckmark extends StatelessWidget {
  const BookingSuccessCheckmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.green[100],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            color: Colors.green[400],
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check_rounded, size: 42, color: Colors.white),
        ),
      ),
    );
  }
}
