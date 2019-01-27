import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:math';

class IpStateWidget extends StatefulWidget {
  static const String routeName = "/http-get-ip";

  @override
  State<StatefulWidget> createState() => new IpWidget();
}

class IpWidget extends State<IpStateWidget> {
  final url = Uri.https('httpbin.org', 'ip');

  Random random = new Random();
  int index = 0;

  final httpClient = new HttpClient();
  String _ipAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Http Get Ip')),
      body: ListTile(
        title: Text(
          'Ip of httpbin.org: ${_ipAddress} - ${index}',
          style: const TextStyle(color: Colors.purple),
        ),
        onTap: () {
          _changeIndex();
          _getIpAddress();
        },
      ),
    );
  }

  void _changeIndex() {
    setState(() {
      index = random.nextInt(100);
    });
  }

  void _getIpAddress() async {
    var request = await httpClient.getUrl(url);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    String ip = json.decode(responseBody)['origin'];
    setState(() {
      _ipAddress = ip;
    });
  }

  @override
  void initState() {
    super.initState();
    _getIpAddress();
  }
}
