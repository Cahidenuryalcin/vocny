import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  hintColor: AppColors.accentColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Arial',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Arial',
      fontSize: 16,
      color: AppColors.textColor,
    ),
  ),
);