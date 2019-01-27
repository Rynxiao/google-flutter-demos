import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  static const String routeName = "/drawer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListTile(
          leading: Icon(Icons.change_history),
          title: Text("drawer"),
          onTap: () {
            print("onTap drawer");
          },
        ),
        elevation: 20.0,
      ),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(),
    );
  }

}