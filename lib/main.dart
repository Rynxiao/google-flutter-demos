import 'package:flutter/material.dart';
import './routes.dart';
import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: HomeScreen(),
      routes: getRoutes(),
    );
  }
}
