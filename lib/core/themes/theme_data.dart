import 'package:fate_date_demo/core/core.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  // ------------- FOR LIGHT MODE ------------
  static ThemeData themeLight = ThemeData(
    primaryColor: BrandColors.kPrimary,
    useMaterial3: true,
    scaffoldBackgroundColor: BrandColors.kColorWhite,
    colorScheme: const ColorScheme.light(
      primary: BrandColors.kPrimary,
      primaryContainer: BrandColors.kPrimaryDark,
      secondary: BrandColors.kYellow,
      onPrimary: BrandColors.kColorWhite,
      surface: BrandColors.kColorWhite,
      onSurface: BrandColors.kBlack,
      error: BrandColors.kError,
      onError: BrandColors.kColorWhite,
    ),
    iconButtonTheme:
        const IconButtonThemeData(style: ButtonStyle(iconSize: WidgetStatePropertyAll<double>(18))),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: BrandColors.kGreyDisabled),
    // primaryTextTheme: AppTextThemes.textThemeLight,
    // textTheme: AppTextThemes.textThemeLight,
    iconTheme: const IconThemeData(color: BrandColors.kBlack, size: AppSpacings.k16),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: BrandColors.kPrimary,
        foregroundColor: BrandColors.kColorWhite,
        shape: const RoundedRectangleBorder(borderRadius: AppSpacings.defaultButtonBorderRadius),
      ),
    ),
  );

  // ------------- FOR DARK MODE ------------

  static ThemeData themeDark = ThemeData(
    primaryColor: BrandColors.kPrimary,
    scaffoldBackgroundColor: BrandColors.kBlack,
    colorScheme: const ColorScheme.light(
      primary: BrandColors.kPrimary,
      secondary: BrandColors.kYellow,
      onPrimary: BrandColors.kColorWhite,
      surface: BrandColors.kBlack,
      onSurface: BrandColors.kColorWhite,
      error: BrandColors.kError,
      onError: BrandColors.kColorWhite,
    ),
    iconTheme: const IconThemeData(color: BrandColors.kColorWhite, size: AppSpacings.k16),

    textSelectionTheme: const TextSelectionThemeData(cursorColor: BrandColors.kGreyDisabled),
    // primaryTextTheme: AppTextThemes.textThemeLight,
  );
}
