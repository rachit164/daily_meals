import 'package:daily_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  const CategoryMealsScreen(
      // this.categoryid,
      // this.categoryTitle,
      this.availableMeals,
      {Key? key})
      : super(key: key);
  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> dispalyedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      dispalyedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    //...
    super.initState();
  }

  void _removeMeal(String mealId) {
    setState(() {
      dispalyedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String categoryid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: dispalyedMeals[index].id,
            title: dispalyedMeals[index].title,
            imageUrl: dispalyedMeals[index].imageUrl,
            duration: dispalyedMeals[index].duration,
            affordability: dispalyedMeals[index].affordability,
            complexity: dispalyedMeals[index].complexity,
            removeItem: _removeMeal,
          );
        },
        itemCount: dispalyedMeals.length,
      ),
    );
  }
}
