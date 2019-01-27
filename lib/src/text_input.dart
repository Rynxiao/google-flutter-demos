import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  static const String routeName = "/textinput";

  final TextEditingController _contorller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var _email;

  @override
  Widget build(BuildContext context) {
    void _submit() {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        showDialog(
            context: context,
            child: AlertDialog(
              title: Text('Alert'),
              content: Text('Email: ${_email}'),
            ));
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Text Input')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _contorller,
            decoration: InputDecoration(
                hintText: 'Type Something', labelText: 'Text Field'),
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text('Alert'),
                    content: Text('You typed ${_contorller.text}'),
                  ));
            },
          ),
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) =>
                      !value.contains('@') ? 'Not a valid email' : null,
                  onSaved: (val) => _email = val,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                ),
                RaisedButton(
                  onPressed: _submit,
                  child: Text('Login'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
