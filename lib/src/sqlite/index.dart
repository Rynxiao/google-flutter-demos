import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:first_flutter_app/src/model/User.dart';
import 'package:first_flutter_app/src/sqlite/DBHelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<List<User>> getUsersFromDB() {
  return DBHelper().getAllUsers();
}

class SqliteWidget extends StatefulWidget {
  static const String routeName = "sqlite";

  @override
  State<StatefulWidget> createState() => SqliteState();
}

class SqliteState extends State<SqliteWidget> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Form buildUpdateForm(user) {
      return Form(
        autovalidate: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text("id: ${user.id.toString()}"),
              ),
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? "Must input user name" : null,
                decoration: InputDecoration(
                    hintText: "Update User Name", labelText: "Name"),
                controller: userNameController,
              ),
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? "Must input phone number" : null,
                decoration: InputDecoration(
                    hintText: "Update User Phone", labelText: "Phone"),
                controller: userPhoneController,
              ),
            ],
          ),
        ),
      );
    }

    void onUpdateUser(user) {
      userNameController.text = user.name;
      userPhoneController.text = user.phone;
      AlertDialog alertDialog = AlertDialog(
        title: Text("Update User"),
        content: buildUpdateForm(user),
        actions: <Widget>[
          FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text("Update"),
            onPressed: () async {
              String updateName = userNameController.text;
              String updatePhone = userPhoneController.text;
              User updateUser = User();
              updateUser.id = user.id;
              updateUser.name =
                  updateName == user.name ? user.name : updateName;
              updateUser.phone =
                  updatePhone == user.phone ? user.phone : updatePhone;
              print(updateUser);
              await DBHelper().updateUser(updateUser);
              Navigator.of(context).pop();
              refreshUserListAfterChanged("Update Successfully");
            },
          )
        ],
      );
      showDialog(context: context, child: alertDialog);
    }

    void onDeleteUser(user) async {
      User deleteUser = User();
      deleteUser.id = user.id;
      await DBHelper().deleteUser(deleteUser);
      refreshUserListAfterChanged("Delete Successfully!");
    }

    Widget buildOperators(user) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.update), onPressed: () => onUpdateUser(user)),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => onDeleteUser(user),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter SQLite"),
      ),
      body: FutureBuilder<List<User>>(
          future: getUsersFromDB(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.hasData && snapshot.data.length > 0) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      User user = snapshot.data[index];
                      return ListTile(
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 90,
                              child: Text(user.name),
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(user.phone),
                            )
                          ],
                        ),
                        leading: Text(user.id.toString()),
                        trailing: buildOperators(user),
                      );
                    });
              } else {
                return Container(
                  alignment: AlignmentDirectional.center,
                  child: Text("No Results Found"),
                );
              }
            }

            return Container(
              alignment: AlignmentDirectional.center,
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            User user = User();
            user.name = generateWordPairs().first.toString();
            user.phone = generatePhoneNumber();
            await DBHelper().insertUser(user);
            refreshUserListAfterChanged("Insert Successfully!");
          }),
    );
  }

  void refreshUserListAfterChanged(String title) {
    showToast(title);
    setState(() {
      getUsersFromDB();
    });
  }

  void showToast(String title) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

String generateFourDigits() {
  var rnd = Random();
  var next = rnd.nextDouble() * 10000;
  while (next < 1000) {
    next *= 10;
  }
  return next.toInt().toString();
}

String generatePhoneNumber() {
  Random random = Random();
  return "13${random.nextInt(9)}${generateFourDigits()}${generateFourDigits()}";
}
