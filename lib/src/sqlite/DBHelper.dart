import 'dart:io';
import 'package:first_flutter_app/src/model/User.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database dbInstance;
  final String TABLE_NAME = "User";

  Future<Database> get database async {
    if (dbInstance == null) {
      dbInstance = await initDB();
    }

    return dbInstance;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDb.db");
    return await openDatabase(path, version: 1, onCreate: onCreateFunc);
  }

  void onCreateFunc(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE_NAME ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "name TEXT, "
        "phone TEXT)");
  }

  rawInsertUser(User newUser) async {
    final db = await database;
    await db.transaction((transaction) async {
      return await transaction.rawInsert("INSERT Into User (name, phone) "
          "VALUES (${newUser.name}, ${newUser.phone})");
    });
  }

  insertUser(User newUser) async {
    final db = await database;
    await db.transaction((transaction) async {
      return await transaction.insert("User", newUser.toMap());
    });
  }

  getUserById(int id) async {
    final db = await database;
    var res = await db.query("User", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? User.fromMap(res.first) : Null;
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    var res = await db.query("User");
    List<User> users = List();
    if (res.isNotEmpty) {
      for (var i = 0; i < res.length; i++) {
        User user = User();
        user.id = res[i]["id"];
        user.name = res[i]["name"];
        user.phone = res[i]["phone"];
        users.add(user);
      }
    }

    return users;
  }

  updateUser(User updateUser) async {
    final db = await database;
    await db.transaction((transaction) async {
      return transaction.update("User", updateUser.toMap(),
          where: "id = ?", whereArgs: [updateUser.id]);
    });
  }

  deleteUser(User deleteUser) async {
    final db = await database;
    await db.transaction((transaction) async {
      return transaction
          .delete("User", where: "id = ?", whereArgs: [deleteUser.id]);
    });
  }

  deleteAllUsers() async {
    final db = await database;
    await db.transaction((transaction) async {
      transaction.rawDelete("Delete * from User");
    });
  }
}
