import 'package:daily_meals/screens/categories_screen.dart';
import 'package:daily_meals/screens/favourites_screen.dart';
import 'package:daily_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favouriteMeals, {Key? key}) : super(key: key);
  final List<Meal> favouriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your Favourites'
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // DefaultTabController(
        // length: 2,
        // child:
        Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        // bottom: const TabBar(
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.category),
        //       text: 'Categories',
        //     ),
        //     Tab(
        //       icon: Icon(Icons.star),
        //       text: 'Favourites',
        //     ),
        //   ],
        // ),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.star),
              label: 'Favourites'),
        ],
      ),
      // body: const TabBarView(
      //   children: [CategoriesScreen(), FavouritesScreen()],
      //    ),
      //   ),
    );
  }
}
