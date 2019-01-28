import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  static const String routeName = "/dropdown-list";

  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<DropDownPage> {
  List _fruits = ['Apple', 'Banana', 'Pineapple', 'Mango', 'Grapes'];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = List();
    for (String fruit in _fruits) {
      items.add(DropdownMenuItem(value: fruit, child: Text(fruit)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DropDown List Title')),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Please choose a fruit'),
              DropdownButton(
                value: _selectedFruit,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              )
            ],
          ),
        ),
      ),
    );
  }
}