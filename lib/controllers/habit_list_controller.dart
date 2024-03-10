import 'package:clean_habits/models/database.dart';
import 'package:clean_habits/models/habit.dart';

class HabitListController {
  static void createHabit(String name, String progressUnit, int progressGoal) {
    IsarService().saveHabit(Habit(
        name: name,
        progressUnit: progressUnit,
        progressGoal: progressGoal,
        progressValue: 0));
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
}
