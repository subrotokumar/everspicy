import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);

  static String route = '/filters';
  final Map<String, bool> currentFilters;
  final Function saveFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, bool currentValue, String discription, Function onchanage) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(discription),
      onChanged: onchanage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fliter'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final SelectFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.saveFilters(SelectFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile("Gluten-free", _glutenFree,
                    "Only include gluton-free meals", (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                }),
                buildSwitchListTile(
                    "Vegetarian", _vegetarian, "Only include Vegetarian meals",
                    (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                }),
                buildSwitchListTile("Vegan", _vegan, "Only include Vegan meals",
                    (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                }),
                buildSwitchListTile(
                    "Lactose-Free", _lactoseFree, "Only include Lactose meals",
                    (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
