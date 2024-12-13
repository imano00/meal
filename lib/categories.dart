import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';

  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: const [
          Text(
            'Category 1',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Category 2',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Category 3',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Category 4',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Category 5',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Category 6',
            style: TextStyle(color: Colors.white),
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
