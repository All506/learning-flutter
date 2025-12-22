import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/data/dummy_data.dart';

// Provider is good for static data
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
