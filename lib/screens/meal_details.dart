import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_detail.dart/meal_detail.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;
  const MealDetailsScreen({
    required this.meal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement meal name,
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: MealDetail(meal: meal),
    );
  }
}
