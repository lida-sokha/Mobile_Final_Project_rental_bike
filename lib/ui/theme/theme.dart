import 'package:flutter/material.dart';

class AppColors {
  static const Color greenStation = Color(0xFF81D79E);
  static const Color redStation = Color(0xFFF19B9B);
  static const Color orangeStation = Color(0xFFFFD580);
  static const Color darkText = Color(0xFF26473D);
  static const Color labelgreen = Color.fromARGB(255, 7, 173, 62);
  static const Color background = Color(0xFFF5F5F5);
  static const Color white = Colors.white;
}

class AppTextStyles {
  static const TextStyle stationLabel = TextStyle(
    fontSize: 15,
    color: AppColors.darkText,
    fontWeight: FontWeight.w500,
  );
}

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColors.greenStation,
  scaffoldBackgroundColor: AppColors.background,
);
