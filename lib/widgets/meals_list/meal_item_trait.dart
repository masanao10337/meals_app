import 'package:flutter/material.dart';
import 'package:meals/widgets/commons/trait_label.dart';

class MealItemTrait extends StatelessWidget {
  final String duration;
  final String complexity;
  final String affordability;

  const MealItemTrait({
    required this.duration,
    required this.complexity,
    required this.affordability,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TraitLabel(
          icon: Icons.schedule,
          label: duration,
        ),
        const SizedBox(width: 12),
        TraitLabel(
          icon: Icons.work,
          label: complexity,
        ),
        const SizedBox(height: 12),
        TraitLabel(
          icon: Icons.attach_money,
          label: affordability,
        ),
      ],
    );
  }
}
