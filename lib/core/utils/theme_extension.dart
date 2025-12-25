import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext
{
  TextTheme get textStyle => Theme.of(this).textTheme;

  ColorScheme get colors => Theme.of(this).colorScheme;

  ThemeData get theme => Theme.of(this);
}