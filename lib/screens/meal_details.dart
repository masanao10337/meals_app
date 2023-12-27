import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_detail.dart/meal_detail.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) toggleFavorite;

  const MealDetailsScreen({
    required this.meal,
    required this.toggleFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement meal name,
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => toggleFavorite(meal),
            icon: Icon(Icons.star),
          )
        ],
      ),
      body: MealDetail(meal: meal),
    );
  }
}
