import 'package:flutter/material.dart';

class FontWidget extends StatelessWidget {
  static const String routeName = "/font";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Custom Fonts'),
      ),
      body: Container(
        child: Center(
          child: Text('The quick brown fox jumps over the lazy dog',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueAccent,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.w400,
                fontSize: 36.0
              )),
        ),
      ),
    );
  }
}
