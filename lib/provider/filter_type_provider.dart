import 'package:fate_date_demo/data/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterTypeProvider = StateProvider<FilterType>((ref) {
  return FilterType.restaurants;
});
