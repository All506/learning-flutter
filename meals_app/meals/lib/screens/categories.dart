import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/categories_grid_item.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.availableMeals});

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals =
        availableMeals.where((meal) => meal.categories.contains(category.id));
    // As part of push it will have a Go Back button
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          onToggleFavorite: onToggleFavorite,
          title: category.title,
          meals: filteredMeals.toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // When building an app that has multiples screen the most efficient way to handle
    // this screens is using scaffold for each one
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map((category) => CategoryGridItem(
                category: category,
                onSelectCategory: () => {_selectCategory(context, category)},
              ))
          .toList(),
    );
  }
}
