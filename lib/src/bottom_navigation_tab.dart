import 'package:flutter/material.dart';
import './tabs/first.dart';
import './tabs/second.dart';
import './tabs/third.dart';

class BottomNavigationTabWidget extends StatefulWidget {
  static const String routeName = "/bottom-navigation-tabs";

  @override
  _BottomNavigationTabState createState() => new _BottomNavigationTabState();

}

class _BottomNavigationTabState extends State<BottomNavigationTabWidget> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() => TabBar(
    tabs: <Tab>[
      Tab(icon: Icon(Icons.favorite)),
      Tab(icon: Icon(Icons.adb)),
      Tab(icon: Icon(Icons.airport_shuttle)),
    ],
    controller: controller,
  );

  TabBarView getTabBarView(tabs) => TabBarView(
    children: tabs,
    controller: controller,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Tabs'),
        backgroundColor: Colors.blue,
      ),
      body: getTabBarView(<Widget>[First(), Second(), Third()]),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: getTabBar(),
      ),
    );
  }
}