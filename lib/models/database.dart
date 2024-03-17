import 'package:clean_habits/controllers/habit_list_controller.dart';
import 'package:clean_habits/models/habit.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveHabit(Habit newHabit) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.habits.putSync(newHabit));
  }

  Future<List<Habit>> getAllHabits() async {
    final isar = await db;
    return isar.habits.where().findAll();
  }

  Future<void> saveProgressForDay(
      Habit habit, DateTime date, int progress) async {
    final isar = await db;

    DayProgress? dayProgress =
        HabitListController.getProgressForDay(habit, date);

    if (dayProgress == null) {
      dayProgress = DayProgress(
          year: date.year,
          month: date.month,
          day: date.day,
          progress: progress);
      habit.progressDays.add(dayProgress);
      isar.writeTxnSync(() => habit.progressDays.saveSync());
    } else {
      dayProgress.progress = progress;
      isar.writeTxnSync(() => isar.dayProgress.putSync(dayProgress!));
    }
  }

  Stream<List<Habit>> listenToHabits() async* {
    final isar = await db;
    yield* isar.habits.where().watch(fireImmediately: true);
  }

  Future<void> deleteHabit(int id) async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.habits.delete(id));
  }

  /*Future<void> habitDeleteProgress(Habit habit) async {
    final isar = await db;
    await isar.writeTxn(() async {
      habit.progressDays.clear();
      return await habit.progressDays.save();
    });
  }*/

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [HabitSchema, DayProgressSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
