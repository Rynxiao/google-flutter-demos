import 'package:flutter/material.dart';
import 'package:first_flutter_app/src/local_image.dart';
import 'package:first_flutter_app/src/local_json.dart';
import 'package:first_flutter_app/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text('Drawer Navigation'));
    var aboutChild = AboutListTile(
      child: Text('About'),
      applicationName: 'Flutter Demos',
      applicationVersion: 'v1.0.0',
      applicationIcon: Icon(Icons.adb),
      icon: Icon(Icons.info),
    );

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.image, 'Local Image', LocalImageWidget.routeName),
      getNavItem(Icons.attach_file, 'Local Json', LocalJsonWidget.routeName),
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(child: listView);
  }


  ListView getBodyList(BuildContext context) {
    final homeListItems = <Column>[];
    getRoutesName().forEach((routeName, displayName) {
      ListTile listTile = ListTile(
        leading: Icon(Icons.folder),
        title: Text(displayName),
        onTap: () {
          setState(() {
            Navigator.of(context).pushNamed(routeName);
          });
        }
      );
      Column row = Column(children: <Widget>[
        listTile,
        Divider()
      ]);
      homeListItems.add(row);
    });
    return ListView(children: homeListItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demos')),
      body: Container(
        child: getBodyList(context)
      ),
      drawer: getNavDrawer(context),
    );
  }
}