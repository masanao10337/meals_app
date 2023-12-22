import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    required this.meal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: const Text('test'),
    );
  }
}
