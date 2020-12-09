import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/toDoModel.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      print('DB NOT CREATED YET');
      return _database;
    }
    _database = await initDB();
    print('DB CREATED');

    return _database;
  }

  initDB() async {
    Directory dataDir = await getApplicationDocumentsDirectory();
    return await openDatabase(
      join(dataDir.path, 'todo-list.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE tasks ("
            "id INTEGER PRIMARY KEY,"
            "task TEXT,"
            "checked BOOLEAN"
            ")");
      },
    );
  }

  createTask(ToDo newTask) async {
    final db = await database;
    var res = await db.rawInsert('''
      INSERT INTO tasks (
        task, date, checked
      ) VALUES (?, ?, ?, ?)
    ''', [newTask.task, newTask.date, newTask.checked]);
    return res;
  }

  Future<List<ToDo>> getTasks() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('tasks');

    var list = List.generate(maps.length, (i) {
      return ToDo(
        id: maps[i]['id'],
        task: maps[i]['task'],
        date: maps[i]['date'],
        checked: maps[i]['checked'],
      );
    });
    list.forEach((element) {
      print(element.task);
    });
    return list;
  }
}
