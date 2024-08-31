import 'dart:developer';

import 'package:fate_date_demo/core/core.dart';
import 'package:fate_date_demo/core/themes/theme_mode.dart';
import 'package:fate_date_demo/domain/restaurants_model.dart';
import 'package:fate_date_demo/presentation/views/login_view.dart';
import 'package:fate_date_demo/presentation/widgets/app_textfield.dart';
import 'package:fate_date_demo/presentation/widgets/restaurants_card.dart';
import 'package:fate_date_demo/presentation/widgets/rounded_main_btn.dart';
import 'package:fate_date_demo/provider/filter_type_provider.dart';
import 'package:fate_date_demo/provider/home_controller.dart';
import 'package:fate_date_demo/provider/keyword_provider.dart';
import 'package:fate_date_demo/provider/restaurants_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final filterType = ref.watch(filterTypeProvider);
    final restaurants = ref.watch(restaurantsProvider);
    final name = ref.watch(nameProvider);
    final theme = ref.read(appThemeModeProvider);
    log('it is ligth mode: ${theme.theme}');
    final homeCtrl = ref.read(homeControllerProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateTime.now().getGreetings(),
              style: context.textTheme.bodyMedium,
            ),
            Text(
              name,
              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          RoundedMainBtn(
            message: 'theme',
            icon: theme.theme == 'dark' ? Icons.sunny: Icons.dark_mode,
            onTap: () {
              if (theme.theme == 'light') {
                theme.changeThemeFromName('dark');
              } else {
                theme.changeThemeFromName('light');
              }
            },
          ),
          RoundedMainBtn(
            message: 'logout',
            icon: Icons.power_settings_new,
            onTap: () {
              ref.invalidate(nameProvider);
              pushReplacement(context, const LoginView());
            },
          ),
        ].paddingInRow(AppSpacings.k8),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.filter_list).onTapWidget(
              onTap: () {
                homeCtrl.showOverlay(context);
              },
              tooltip: 'filter',
            ),
            onChanged: (value) {
              ref.read(keywordProvider.notifier).update((state) => value);
            },
            hintText: 'Search "${filterType.type}"',
          ),
          Expanded(
            child: _restaurantsBody(context, restaurants),
          )
        ].paddingInColumn(AppSpacings.k20),
      ).padSymmetric(vertical: AppSpacings.k20, horizontal: AppSpacings.k12),
    );
  }

  Column _restaurantsBody(BuildContext context, AsyncValue<List<RestaurantsModel>> restaurants) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Restaurants',
          style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        restaurants.when(
          data: (data) => data.isEmpty
              ? Center(
                  child: const Text('No Result found').padSymmetric(vertical: AppSpacings.k20),
                )
              : Column(
                  children: List.generate(
                    data.length,
                    (index) => RestaurantsCard(restaurantsModel: data[index], index: index),
                  ),
                ),
          error: (err, _) => const Center(child: Text('An error occured')),
          loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        )
      ].paddingInColumn(AppSpacings.k8),
    );
  }
}
