import 'package:flutter/material.dart';

class AppColors {
  static const lime = Color(0xFFB6FF00);
  static const limeDark = Color(0xFF579800);
  static const navy = Color(0xFF080D25);
  static const muted = Color(0xFF778099);
  static const border = Color(0xFFE9ECF0);
  static const softGreen = Color(0xFFF3FBE9);
  static const surface = Color(0xFFF7F8FA);
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lime,
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.navy,
      elevation: 0,
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.navy,
        fontSize: 30,
        fontWeight: FontWeight.w800,
        height: 1.15,
      ),
      titleMedium: TextStyle(
        color: AppColors.navy,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        color: AppColors.muted,
        fontSize: 14,
        height: 1.5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.limeDark, width: 1.5),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
    ),
  );
}
