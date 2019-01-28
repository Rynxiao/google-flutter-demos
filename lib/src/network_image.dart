import 'package:flutter/material.dart';

class NetworkImagePage extends StatelessWidget {
  static const String routeName = "/network-image";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Load Image From Network')),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.network('https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/flutter_logo.png'),
            Image.network('https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/loop_anim.gif'),
          ],
        ),
      ),
    );
  }
}