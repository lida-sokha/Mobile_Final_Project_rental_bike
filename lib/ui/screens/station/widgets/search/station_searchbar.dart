import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/station_view_model.dart';

class StationSearchBar extends StatelessWidget {
  const StationSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<StationViewModel>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        onChanged: viewModel.updateSearchQuery,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {},
          ),

          hintText: 'Wat Phnom Station',
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 15),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
