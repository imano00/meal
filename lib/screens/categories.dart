import 'package:flutter/material.dart';

import 'package:meal/data/dummy_data.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/widgets/category_grid_item.dart';
import 'package:meal/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context,route)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.only(right: 16, left: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          // alternative to using availableCategories.map
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              title: const Text('Choose a category'),
              automaticallyImplyLeading: false,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
