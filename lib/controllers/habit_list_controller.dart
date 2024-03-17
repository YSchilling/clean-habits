import 'package:clean_habits/models/database.dart';
import 'package:clean_habits/models/habit.dart';
import 'package:isar/isar.dart';

class HabitListController {
  static void createHabit(String name, String progressUnit, int progressGoal) {
    IsarService().saveHabit(Habit(
      name: name,
      progressUnit: progressUnit,
      progressGoal: progressGoal,
    ));
  }

  static Future<List<Habit>> getHabits() {
    return IsarService().getAllHabits();
  }

  static void updateHabit(Habit habit) {
    IsarService().saveHabit(habit);
  }

  static void deleteHabit(int id) {
    IsarService().deleteHabit(id);
  }

  static DayProgress? getProgressForDay(Habit habit, DateTime date) {
    return habit.progressDays
        .filter()
        .dayEqualTo(date.day)
        .and()
        .monthEqualTo(date.month)
        .and()
        .yearEqualTo(date.year)
        .findFirstSync();
  }

  static void saveProgressForDay(Habit habit, DateTime date, int progress) {
    IsarService().saveProgressForDay(habit, date, progress);
  }
}
