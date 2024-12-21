import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meal_detail.dart';
import 'package:meal/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, index) => Text(meals[index].title),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Uh oh ... nothing to see here!',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      );
    }

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (context, meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
