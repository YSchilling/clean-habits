import 'package:clean_habits/models/database.dart';
import 'package:flutter/material.dart';
import 'package:clean_habits/models/habit_model.dart';

class HabitListNotifier extends ChangeNotifier {
  Future<List<HabitModel>> _habits = SQLHelper.getHabits();

  Future<List<HabitModel>> getHabits() {
    return _habits;
  }

  void addHabit(String name) {
    SQLHelper.insertHabit(name);
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
