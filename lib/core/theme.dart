import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
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
      // headlineLarge: TextStyle(
      //     fontSize: 32,
      //     color: AppColors.black
      // ),
      // headlineMedium: TextStyle(
      //     fontSize: 28,
      //     color: AppColors.black
      // ),
      // headlineSmall: TextStyle(
      //     fontSize: 24,
      //     color: AppColors.black
      // ),
      titleLarge: TextStyle(fontSize: 22, color: AppColors.black),
      titleMedium: TextStyle(fontSize: 16, color: AppColors.black),
      titleSmall: TextStyle(fontSize: 14, color: AppColors.black),
      labelLarge: TextStyle(fontSize: 14, color: AppColors.black),
      labelMedium: TextStyle(fontSize: 12, color: AppColors.black),
      labelSmall: TextStyle(fontSize: 11, color: AppColors.black),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.yellow),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.yellow),
      bodySmall: TextStyle(fontSize: 12, color: AppColors.yellow),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.yellow,
      elevation: 0,
      centerTitle: true,

      surfaceTintColor: Colors.transparent,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16),
        textStyle: const TextStyle(fontSize: 20, color: AppColors.black),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 18),
        foregroundColor: AppColors.white,
        overlayColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.white,
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,
      hintStyle: const TextStyle(fontSize: 18, color: AppColors.white),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
  );
}
