import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() {
    return ThemeData.light().copyWith(
      // Define the default colors.
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      scaffoldBackgroundColor: AppColors.scaffold,
    );
  }
}
