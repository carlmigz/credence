import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: AppColors.white,
    secondary: AppColors.charcoalBlack,
    tertiary: AppColors.white,
  ),
  dividerTheme: DividerThemeData(thickness: 0.1),
);
