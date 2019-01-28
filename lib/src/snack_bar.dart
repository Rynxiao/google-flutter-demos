import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  static const String routeName = "/snack-bar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Using SnackBar')),
      body: Center(child: SnackBarWidget()),
    );
  }

}

class SnackBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Show SnackBar'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Hello! I am SnackBar :)'),
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Hint Me (Action)',
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Hello! I am shown becoz you pressed Action :)')
              ));
            }
          ),
        ));
      },
    );
  }
}