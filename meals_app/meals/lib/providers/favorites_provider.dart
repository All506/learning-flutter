import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // Will construct an empty list as app starts
  FavoriteMealsNotifier() : super([]);

  // In stateNotifier objects can be modified, must create a new one.
  bool toggleMealFavoriteStatus(Meal meal) {
    // Is meals part of the list or not
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // Will keep meal if it is not in list with same id
      state = state.where((meal) => meal.id != meal.id).toList();
      return false;
    } else {
      // Will add item to list
      state = [...state, meal];
      return true;
    }
  }
}

// For dynamic data is better StateNotifierProvider
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
