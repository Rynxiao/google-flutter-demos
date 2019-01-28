import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  static const String routeName = "/gridview";
  MyGridView myGridView = MyGridView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView Layout')),
      body: myGridView.build(),
    );
  }
}

class MyGridView {
  Card getStructuredGridCell(name, image) {
    return Card(
      elevation: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new Image(image: AssetImage('data/images/${image}')),
          Center(child: Text(name))
        ],
      ),
    );
  }

  GridView build() {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStructuredGridCell('Launcher Icon', 'ic_launcher.png'),
        getStructuredGridCell('Launcher Icon', 'ic_launcher.png'),
        getStructuredGridCell('Launcher Icon', 'ic_launcher.png'),
        getStructuredGridCell('Launcher Icon', 'ic_launcher.png'),
        getStructuredGridCell('Launcher Icon', 'ic_launcher.png'),
        getStructuredGridCell('Launcher Icon', 'ic_launcher.png'),
      ],
    );
  }
}