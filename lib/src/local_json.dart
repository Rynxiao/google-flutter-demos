import 'dart:convert';

import 'package:flutter/material.dart';

class LocalJsonWidget extends StatefulWidget {
  static const String routeName = "/local-json";

  _LocalJsonState createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJsonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load Local JSON file'),
      ),
      body: Container(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('data/json/data.json'),
          builder: (context, snapshot) {
            var newData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Name: ${newData[index]['name']}',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                          child: Text('Height: ${newData[index]['height']}'),
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                          child: Text('Mass: ${newData[index]['mass']}'),
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                          child: Text(
                              'Hair Color: ${newData[index]['hair_color']}'),
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                          child: Text(
                              'Skin Color: ${newData[index]['skin_color']}'),
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                          child:
                              Text('Eye Color: ${newData[index]['eye_color']}'),
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                          child: Text(
                              'Birth Year: ${newData[index]['birth_year']}'),
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                          child: Text('Gender: ${newData[index]['gender']}'),
                          padding: EdgeInsets.all(10.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: newData == null ? 0 : newData.length,
            );
          },
        ),
      ),
    );
  }
}
