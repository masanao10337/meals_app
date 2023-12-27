import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meals_list/meals_list.dart';
import 'package:meals/widgets/meals_list/not_found.dart';

//TODO: onselectMealでのページの更新から。

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
  late Widget _mainContent;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _mainContent = (widget.meals.isEmpty)
        ? const NotFound()
        : MealsList(
            meals: widget.meals,
            selectMeal: selectMeal,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _mainContent,
    );
  }
}
