import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: AppColors.charcoalBlack,
    secondary: AppColors.white,
    tertiary: AppColors.dirtyWhite,
  ),
  dividerTheme: DividerThemeData(thickness: 0.1),
);
