import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/categories_grid_item.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// with: will add a mix in, mixing two classes code
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // late tells a variable will have a value as soon it is used first time.
  // if there is more than one animation use TickerProviderStateMixin
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      // they are implicit so are not necessary to declare
      lowerBound: 0,
      upperBound: 1,
    );

    // to start the animation
    _animationController.forward();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id));
    // As part of push it will have a Go Back button
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals.toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // animationController is removed from device once it ends
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // When building an app that has multiples screen the most efficient way to handle
    // this screens is using scaffold for each one
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) => SlideTransition(
        // drive will take lower and upperbound to create numbers between
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        )),
        child: child,
      ),
    );
  }
}
