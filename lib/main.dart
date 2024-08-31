import 'package:fate_date_demo/core/core.dart';
import 'package:fate_date_demo/core/themes/theme_mode.dart';
import 'package:fate_date_demo/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = ref.watch(appThemeModeProvider);
    return ValueListenableBuilder(
        valueListenable: apptheme.themeDataNotifier,
        builder: (context, theme, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: StringConstants.projectTitle,
            onGenerateTitle: (context) => StringConstants.projectTitle,
            theme: theme,
            home: const LoginView(),
          );
        });
  }
}
