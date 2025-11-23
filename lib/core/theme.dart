import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme:  const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.yellow,
      onPrimary: AppColors.black,
      secondary: AppColors.white,
      onSecondary: AppColors.black,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.black,
      onSurface: AppColors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32,
          color: AppColors.black
      ),
      headlineMedium: TextStyle(
          fontSize: 28,
          color: AppColors.black
      ),
      headlineSmall: TextStyle(
          fontSize: 24,
          color: AppColors.black
      ),
      titleLarge: TextStyle(
          fontSize: 22,
          color: AppColors.black
      ),
      titleMedium: TextStyle(
          fontSize: 16,
          color: AppColors.black
      ),
      titleSmall: TextStyle(
          fontSize: 14,
          color: AppColors.black
      ),
      labelLarge: TextStyle(
          fontSize: 14,
          color: AppColors.black
      ),
      labelMedium: TextStyle(
          fontSize: 12,
          color: AppColors.black
      ),
      labelSmall: TextStyle(
          fontSize: 11,
          color: AppColors.black
      ),
      bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.black
      ),
      bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.black
      ),
      bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.black
      ),
    ),
  );
}
