import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DynamicPhotosStreamPage extends StatefulWidget {
  static const String routeName = "/dynamic-photo-stream";

  @override
  DynamicPhotosStreamState createState()  => DynamicPhotosStreamState();
}

class DynamicPhotosStreamState extends State<DynamicPhotosStreamPage> {
  StreamController<Photo> streamController;
  List<Photo> list = [];

  @override
  void initState() {
    super.initState();
    streamController = StreamController.broadcast();
    streamController.stream.listen((p) => setState(
        () => list.add(p)
    ));

    load(streamController);
  }

  load(StreamController sc) async {
    String url = 'https://jsonplaceholder.typicode.com/photos';
    var client = new http.Client();
    var req = new http.Request('get', Uri.parse(url));
    var streamedRes = await client.send(req);
    streamedRes.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((e) => e)
        .map((map) => Photo.fromJsonMap(map))
        .pipe(streamController);
  }

  @override
  void dispose() {
    super.dispose();
    streamController?.close();
    streamController = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo Streams')),
      body: Center(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => _makeElement(index)
        ),
      ),
    );
  }

  Widget _makeElement(int index) {
    if (index >= list.length) {
      return null;
    }

    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Image.network(list[index].url),
          Text(list[index].title)
        ],
      ),
    );
  }
}

class Photo {
  final String title;
  final String url;

  Photo.fromJsonMap(Map map)
    : title = map['title'],
      url = map['url'];
}