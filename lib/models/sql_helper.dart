/*
import 'package:clean_habits/models/habit.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Future<void> createTables(Database database) async {
    database.execute("""CREATE TABLE habit (
          id INTEGER PRIMARY KEY,
          name TEXT,
          progressUnit TEXT,
          progressValue INTEGER,
          progressGoal INTEGER
          )""");
  }

  static Future<Database> getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'clean_habits_database.db'),
      version: 1,
      onCreate: (db, version) {
        return createTables(db);
      },
    );
  }

  static Future<int> createHabit(
      String name, String progressUnit, int progressGoal) async {
    final db = await getDB();

    final data = {
      'name': name,
      'progressUnit': progressUnit,
      'progressValue': 0,
      'progressGoal': progressGoal
    };
    final id =
        db.insert('habit', data, conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<HabitModel>> getHabits() async {
    final db = await getDB();
    final List<Map<String, dynamic>> query =
        await db.query('habit', orderBy: 'id');

    return List.generate(query.length, (index) {
      return HabitModel(
        id: query[index]['id'],
        name: query[index]['name'],
        progressUnit: query[index]['progressUnit'],
        progressValue: query[index]['progressValue'],
        progressGoal: query[index]['progressGoal'],
      );
    });
  }

  static Future<HabitModel> getHabit(int id) async {
    final db = await getDB();
    final List<Map<String, dynamic>> query =
        await db.query('habit', where: 'id = ?', whereArgs: [id], limit: 1);

    return HabitModel(
      id: query[0]['id'],
      name: query[0]['name'],
      progressUnit: query[0]['progressUnit'],
      progressValue: query[0]['progressValue'],
      progressGoal: query[0]['progressGoal'],
    );
  }

  static Future<int> updateHabit(HabitModel habit) async {
    final db = await getDB();

    final result = await db.update(
      'habit',
      habit.toMap(),
      where: 'id = ?',
      whereArgs: [habit.id],
    );
    return result;
  }

  static Future<void> deleteHabit(int id) async {
    final db = await getDB();
    try {
      await db.delete(
        'habit',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
*/