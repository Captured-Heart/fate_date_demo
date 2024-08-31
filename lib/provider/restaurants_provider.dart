import 'package:fate_date_demo/data/enums.dart';
import 'package:fate_date_demo/data/restaurants.dart';
import 'package:fate_date_demo/domain/restaurants_model.dart';
import 'package:fate_date_demo/provider/filter_type_provider.dart';
import 'package:fate_date_demo/provider/keyword_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantsProvider = StreamProvider<List<RestaurantsModel>>((ref) {
  final restaurantsQuery = restaurantsLists.map((e) => RestaurantsModel.fromMap(e)).toList();
  final keyword = ref.watch(keywordProvider);
  final type = ref.watch(filterTypeProvider);

  return Stream.periodic(Durations.medium1, (_) {
    final restaurants = restaurantsQuery.where(
      (element) {
        return switch (type) {
          FilterType.restaurants => element.name!.toLowerCase().contains(keyword.toLowerCase()),
          FilterType.cuisineType => element.cuisine!.toLowerCase().contains(keyword.toLowerCase()),
        };
      },
    ).toList();

    return restaurants;
  });
});
