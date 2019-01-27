import 'package:flutter/material.dart';

class LocalImageWidget extends StatelessWidget {
  static const String routeName = "/local-image";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load Local image'),
      ),
      body: Container(
        child: Center(
          child: Text('Xing', style: TextStyle(color: Colors.white)),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('data/images/2.jpeg'), fit: BoxFit.cover)),
      ),
    );
  }
}
