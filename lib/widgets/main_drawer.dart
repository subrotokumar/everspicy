import 'package:flutter/material.dart';
import '../pages/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  //const MainDrawer({ Key? key }) : super(key: key);

  Widget buildListTile(IconData icon, String titleText, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        titleText,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.pushReplacementNamed(context, FilterScreen.route);
          }),
        ],
      ),
    );
  }
}
