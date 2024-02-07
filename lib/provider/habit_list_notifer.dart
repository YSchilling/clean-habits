import 'package:clean_habits/models/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:clean_habits/models/habit_model.dart';

class HabitListNotifier extends ChangeNotifier {
  Future<List<HabitModel>> _habits = SQLHelper.getHabits();
  HabitModel? currentHabit;

  Future<List<HabitModel>> getHabits() {
    return _habits;
  }

  void addHabit(
      String name, String progressUnit, int progressValue, int progressGoal) {
    SQLHelper.createHabit(name, progressUnit, progressValue, progressGoal);
    _habits = SQLHelper.getHabits();
    notifyListeners();
  }

  void updateHabit(HabitModel habit) {
    SQLHelper.updateHabit(habit);
    _habits = SQLHelper.getHabits();
    notifyListeners();
  }

  void deleteHabit(int id) {
    SQLHelper.deleteHabit(id);
    _habits = SQLHelper.getHabits();
    notifyListeners();
  }
}
