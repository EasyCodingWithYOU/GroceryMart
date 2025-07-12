import 'package:flutter/material.dart';

class AppColors {
  // Primary theme color (e.g. buttons, highlights)
  static const Color primary = Color(0xFF53B175);
  static const Color grey = Color(0xffB3B3B3);

  // Background color for search bar, input fields, etc.
  static const Color backgroundLight = Color(0xFFF2F3F2);

  // Review star/icon color
  static const Color reviewIcon = Color(0xFFF3603F);

  // Primary text color
  static const Color textPrimary = Color(0xFF181725);
  static const Color textColordark = Color(0xff4C4F4D);

  // Item background variants (e.g. category/item cards)
  static const Color bgPeach = Color(0xFFF7A593);
  static const Color bgOrange = Color(0xFFF8A44C);
  static const Color bgPurple = Color(0xFFD3B0E0);
  static const Color bgBlue = Color(0xFFB7DFF5);
  static const Color bgOrangeOverlay = Color(0xB2F8A44C);
  static const List<Color> bgColors = [
    AppColors.bgPeach,

    AppColors.bgOrange,
    AppColors.bgBlue,

    AppColors.bgPurple,
  ];
}
