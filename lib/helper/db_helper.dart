import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:tatsam/screens/home/Model/CountryModel.dart';

class DbHelper {
  Database database;
  bool status = false;

  Future<Database> get db async {
    if (database != null) {
      return database;
    }
    // Initialise db
    database = await openDb();
    return database;
  }

  Future openDb() async {
    // open the database
    Database database = await openDatabase(
        join(await getDatabasesPath(), 'tatsum_db.db'),
        version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE tatsum_db (key TEXT, country TEXT, region TEXT)');
    });
    status = true;
    return database;
  }

  Future insertModel(CountryModel model) async {
    final database = await db;
    await database.insert('tatsum_db', model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return model;
  }

  Future<List<Map<String, dynamic>>> getList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query("tatsum_db");
    return result;
  }

  Future<List<CountryModel>> getMapList() async {
    final List<Map<String, dynamic>> taskMapList = await getList();
    final List<CountryModel> taskList = [];
    taskMapList.forEach((taskMap) {
      taskList.add(CountryModel.fromJson(taskMap));
    });
    return taskList;
  }

  Future<bool> dbIsEmpty() async {
    database = await openDatabase('tatsum_db.db');
    try {
      Sqflite.firstIntValue(
          await database.rawQuery('SELECT COUNT(*) FROM tatsum_db'));
      return true;
    } catch (e) {
      return false;
    }
  }
}
