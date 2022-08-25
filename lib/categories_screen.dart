import 'package:daily_meals/category_item.dart';
import 'package:flutter/cupertino.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      childAspectRatio: 3/2,crossAxisSpacing: 20,mainAxisSpacing: 20
    ),
      children:  DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.title, catData.color)).toList(),

    );
  }
}
