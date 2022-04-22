import 'package:flutter/material.dart';
import 'package:spicy_box/data/dummy_data.dart';
import './pages/favorite.dart';
import './pages/filter_screen.dart';
import './models/meal.dart';
import './pages/meal_detail_screen.dart';
import './pages/category_meal_screen.dart';
import './pages/tab_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  List<Meal> _availabeMeals = dummyMeal;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availabeMeals = dummyMeal.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

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
        CategoryMealScreen.route: (ctx) => CategoryMealScreen(_availabeMeals),
        MealDetailScreen.route: (ctx) => MealDetailScreen(),
        FavoritePage.route: (ctx) => FavoritePage(),
        FilterScreen.route: (ctx) => FilterScreen(_filters, _setFilters),
      },
    );
  }
}
