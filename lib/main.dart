import 'package:flutter/material.dart';

import './pages/meal_detail_screen.dart';
import './pages/category_meal_screen.dart';
//import './pages/categories_screen.dart';
import './pages/tab_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ever Spicy',
      theme: ThemeData(
        canvasColor: Color.fromARGB(255, 226, 226, 218),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMealScreen.route: (ctx) => CategoryMealScreen(),
        MealDetailScreen.route: (ctx) => MealDetailScreen()
      },
    );
  }
}
