import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  static const String routeName = "/gradient";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load Local image'),
      ),
      body: Container(
        child: Center(
          child: Text('Hello world', style: TextStyle(color: Colors.white)),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.blueAccent],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.6, 0.0),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp
          ),
        ),
      ),
    );
  }
}
