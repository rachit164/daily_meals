import 'package:flutter/cupertino.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen(this.favouriteMeals, {Key? key}) : super(key: key);
  final List<Meal> favouriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
          child: Text('You have no favourites yet -start adding some!'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
