import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/bike/bike.dart';
import '../view_model/booking_view_model.dart';
import '../booking_success_screen.dart';

class BookingActions extends StatelessWidget {
  final Bike bike;
  final String dockNumber;
  final String stationName;

  const BookingActions({
    super.key,
    required this.bike,
    required this.dockNumber,
    required this.stationName,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BookingViewModel>();
    final bool isAvailable = bike.status == "available";

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[500],
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: isAvailable ? () => _handleBooking(context, vm) : null,
            child: vm.isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Text(
                    "Confirm Booking",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
          ),
        ),
      ],
    );
  }

  void _handleBooking(BuildContext context, BookingViewModel vm) async {
    await vm.bookBike(bike.id);
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => BookingSuccessScreen(
            bike: bike,
            dockNumber: dockNumber,
            stationName: stationName,
          ),
        ),
      );
    }
  }
}
