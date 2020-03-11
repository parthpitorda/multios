import 'dart:io';
import 'package:multios/Vo/VoRecordUser.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;
  static String FristName = "first_name";
  static String LastName = "last_name";
  static String Email = "email";
  static String ID = "id";

  static final table = 'test';

  Database database;


  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, _databaseName);

    database = await openDatabase(dbPath, version: _databaseVersion, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $table ("
        "$ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "$FristName TEXT,"
        "$LastName TEXT,"
        "$Email TEXT"
        ")");
  }


  Future<int> createCustomer(RecordUser recordUser) async{
    return await database?.insert(table, recordUser.toJson());
  }

  createCustomerRaw(RecordUser recordUser) async {
    var result = await database.rawInsert(
        "INSERT INTO $table (first_name, last_name, email)"
            " VALUES (${recordUser.name},${recordUser.votes},${recordUser.votes})");
    return result;
  }

  Future<List> getCustomers() async {
    var result = await database.rawQuery('SELECT * FROM $table');
    return result.toList();
  }

}