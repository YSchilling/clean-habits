import 'package:clean_habits/models/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:clean_habits/models/habit_model.dart';

class HabitListNotifier extends ChangeNotifier {
  Future<List<HabitModel>> _habits = SQLHelper.getHabits();
  HabitModel? currentHabit;

  // createHabit
  // getHabits
  // selectHabit
  // updateHabit
  // deleteHabit

  Future<List<HabitModel>> getHabits() {
    return _habits;
  }

  HabitModel? getCurrentHabit() {
    return currentHabit;
  }

  void setCurrentHabit(HabitModel habit) {
    currentHabit = habit;
    notifyListeners();
  }

  void updateCurrentHabit(HabitModel habit) {
    currentHabit = habit;
    updateHabit(habit);
    _reloadHabitList();
  }

  void createHabit(String name, String progressUnit, int progressGoal) {
    SQLHelper.createHabit(name, progressUnit, progressGoal);
    _reloadHabitList();
  }

  void updateHabit(HabitModel habit) {
    SQLHelper.updateHabit(habit);
    _reloadHabitList();
  }

  void deleteHabit(int id) {
    SQLHelper.deleteHabit(id);
    _reloadHabitList();
  }

  void _reloadHabitList() {
    _habits = SQLHelper.getHabits();
    notifyListeners();
  }
}
