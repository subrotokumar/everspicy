import 'package:flutter/material.dart';
import 'package:spicy_box/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritePage extends StatelessWidget {
  //const FavoritePage({Key key}) : super(key: key);

  static String route = '/favorite-page';

  final List<Meal> favoriteMeals;
  FavoritePage(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text('No Favorite Found!'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
