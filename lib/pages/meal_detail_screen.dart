import 'package:flutter/material.dart';
import 'package:spicy_box/data/dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const route = '/meal-detail';
  //const MealDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealData = dummyMeal.firstWhere((element) => element.id == mealId);
    final PreferredSizeWidget appbar = AppBar(
      title: Text('${mealData.title}'),
    );

    Widget buildSectionTitle(String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        height: 200,
        width: 300,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      );
    }

    return Scaffold(
      appBar: appbar,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text("${mealData.ingredients[index]}"),
                    ),
                  );
                }),
                itemCount: mealData.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) {
                  return Column(children: <Widget>[
                    if (index > 0) Divider(),
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text("${mealData.steps[index]}"),
                    ),
                  ]);
                }),
                itemCount: mealData.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
