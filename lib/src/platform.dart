import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  static const String routeName = "/platform";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platform'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                textColor: Colors.purple,
                child: Text('Which Platform am I?'),
                onPressed: () {
                  var platform;
                  if (Theme.of(context).platform == TargetPlatform.iOS) {
                    platform = 'IOS';
                  } else if (Theme.of(context).platform == TargetPlatform.android) {
                    platform = 'Android';
                  } else if (Theme.of(context).platform == TargetPlatform.fuchsia) {
                    platform = 'Fuchsia';
                  } else {
                    platform = 'not recognised';
                  }
                  showDialog(
                      context: context,
                      child: AlertDialog(
                        title: Text('Platform'),
                        content: Text(platform),
                      )
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                textColor: Colors.purple,
                child: Text('Which Platform am I?'),
                onPressed: () {
                  var platform;
                  if (Theme.of(context).platform == TargetPlatform.iOS) {
                    platform = 'IOS';
                  } else if (Theme.of(context).platform == TargetPlatform.android) {
                    platform = 'Android';
                  } else if (Theme.of(context).platform == TargetPlatform.fuchsia) {
                    platform = 'Fuchsia';
                  } else {
                    platform = 'not recognised';
                  }
                  showDialog(
                      context: context,
                      child: AlertDialog(
                        title: Text('Platform'),
                        content: Text(platform),
                      )
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}