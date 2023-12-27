import 'package:flutter/material.dart';
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
  final List<TabItem> _tabs = [
    const TabItem(
      page: CategoriesScreen(),
      title: 'Categories',
      icon: Icon(Icons.set_meal),
    ),
    const TabItem(
      page: MealsScreen(meals: []),
      title: 'Favorites',
      icon: Icon(Icons.star),
    ),
  ];

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
