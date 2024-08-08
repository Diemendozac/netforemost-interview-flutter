
import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme(
        primary: ThemeColors.primary,
        onPrimary: ThemeColors.onPrimary,
        secondary: ThemeColors.secondary,
        onSecondary: ThemeColors.onSecondary,
        tertiary: ThemeColors.tertiary,
        onTertiary: ThemeColors.onTertiary,
        surface: ThemeColors.surface,
        onSurface: ThemeColors.onSurface,
        background: ThemeColors.background,
        onBackground: ThemeColors.onBackground,
        error: ThemeColors.error,
        onError: ThemeColors.onError,
        brightness: Brightness.light
      ),
      textTheme: TextTheme(
        titleMedium: ThemeTextStyles.titleMedium,
        bodyMedium: ThemeTextStyles.bodyMedium,

      )

    );
  }
}
