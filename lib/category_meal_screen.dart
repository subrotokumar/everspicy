import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static const route = '/categories-meals';
  // final String id;
  // final String title;
  // final Color color;

  // CategoryMealScreen(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
        child: Text('The recipes for the Category'),
      ),
    );
  }
}
