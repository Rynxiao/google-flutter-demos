import 'package:flutter/material.dart';
import './ip.dart';

class GestureWidget extends StatelessWidget {
  static const String routeName = "/gesture";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gestures"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Tap, Long Press, Swipe Horizontally or Vertically"),
              IpStateWidget()
            ],
          ),
        ),
      ),
      onTap: () {
        print("Tapped");
      },
      onLongPress: () {
        print("Long Press");
      },
      onVerticalDragEnd: (DragEndDetails value) {
        print("Swipe Vertically");
      },
      onHorizontalDragEnd: (DragEndDetails value) {
        print("Swipe Horizontally");
      },
    );
  }

}