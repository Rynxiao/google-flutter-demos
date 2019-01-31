import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistKeyValuePage extends StatefulWidget {
  static const String routeName = "/persist-key-value";

  @override
  PersisKeyValueState createState() => PersisKeyValueState();
}

class PersisKeyValueState extends State<PersistKeyValuePage> {
  var counter = 0;
  var key = 'counter';

  @override
  void initState() {
    super.initState();
    _loadSaveData();
  }

  _loadSaveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      counter = (sharedPreferences.getInt(key) ?? 0);
    });
  }

  _onIncrementHit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      counter = (sharedPreferences.getInt(key) ?? 0) + 1;
    });
    sharedPreferences.setInt(key, counter);
  }

  _onDecrementHit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      counter = (sharedPreferences.getInt(key) ?? 0) - 1;
    });
    sharedPreferences.setInt(key, counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Persist Key Value')),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${counter}', textScaleFactor: 10.0),
                Padding(padding: EdgeInsets.all(10.0)),
                RaisedButton(
                  onPressed: _onIncrementHit,
                  child: Text('Increment Counter'),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                RaisedButton(
                  onPressed: _onDecrementHit,
                  child: Text('Decrement Counter'),
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}