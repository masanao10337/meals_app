import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabItem {
  final Widget page;
  final String title;
  final Icon icon;

  const TabItem({required this.page, required this.title, required this.icon});
}

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<TabItem> get _tabs => [
        TabItem(
          page: CategoriesScreen(
            toggleFavorite: _toggleMealFavoritesStatus,
          ),
          title: 'Categories',
          icon: Icon(Icons.set_meal),
        ),
        TabItem(
          page: MealsScreen(
            toggleFavorite: _toggleMealFavoritesStatus,
            meals: [],
          ),
          title: 'Favorites',
          icon: const Icon(Icons.star),
        ),
      ];

  //NOTE: 複数のwidgetsにまたがる状態管理
  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavoritesStatus(Meal meal) {
    _favoriteMeals.contains(meal)
        ? _favoriteMeals.remove(meal)
        : _favoriteMeals.add(meal);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeTab = _tabs[_selectedPageIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(activeTab.title),
      ),
      body: activeTab.page,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: _tabs
            .map((tab) => BottomNavigationBarItem(
                  icon: tab.icon,
                  label: tab.title,
                ))
            .toList(),
      ),
    );
  }
}
