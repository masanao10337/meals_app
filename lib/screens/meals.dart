import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meals_list/meals_list.dart';
import 'package:meals/widgets/meals_list/not_found.dart';

class MealsScreen extends StatefulWidget {
  final String title;
  final List<Meal> meals;

  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  late Widget mainContent;

  @override
  void initState() {
    super.initState();
    mainContent = (widget.meals.isEmpty)
        ? const NotFound()
        : MealsList(meals: widget.meals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: mainContent,
    );
  }
}
