import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/meal-deatil';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text(mealId),
        ),
        body: Column(
          children: const [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(src),
            )
          ],
        ));
  }
}
