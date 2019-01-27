import 'package:flutter/material.dart';
import './tabs/first.dart';
import './tabs/second.dart';
import './tabs/third.dart';

class TabsWidget extends StatefulWidget {
  static const String routeName = "/top-tabs";

  @override
  _TabsState createState() => new _TabsState();

}

class _TabsState extends State<TabsWidget> with SingleTickerProviderStateMixin {
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
        title: Text('Using Tabs On Top'),
        backgroundColor: Colors.blue,
        bottom: getTabBar(),
      ),
      body: getTabBarView(<Widget>[First(), Second(), Third()]),
    );
  }
}