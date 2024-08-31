// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:ui';
import 'package:fate_date_demo/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeModeProvider = Provider<AppTheme>((ref) {
  return AppTheme(ref);
});

class AppTheme {
  final Ref ref;

  AppTheme(this.ref);

  String? theme = 'dark';

  ValueNotifier<ThemeData> themeDataNotifier = ValueNotifier<ThemeData>(AppThemeData.themeDark);
  bool isLightMode(BuildContext context) => Theme.of(context).brightness == Brightness.light;

  void changeTheme(ThemeData data) {
    themeDataNotifier.value = data;
    themeDataNotifier.notifyListeners();
  }

  void changeThemeFromName(String theme) async {
    this.theme = theme;
    themeDataNotifier.value = (() {
      switch (theme) {
        case "light":
          return AppThemeData.themeLight;
        case "dark":
          return AppThemeData.themeDark;
        default:
          final theme = PlatformDispatcher.instance.platformBrightness;
          bool isDarkMode = theme == Brightness.dark;
          return isDarkMode ? AppThemeData.themeDark : AppThemeData.themeLight;
      }
    })();
  }
}
