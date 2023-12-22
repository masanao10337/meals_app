import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meals_list/meal_item.dart';

class MealsList extends StatelessWidget {
  final List<Meal> meals;
  const MealsList({required this.meals, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
    );
  }
}
