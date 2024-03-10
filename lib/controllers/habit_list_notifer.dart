import 'package:clean_habits/models/database.dart';
import 'package:flutter/material.dart';
import 'package:clean_habits/models/habit.dart';

class HabitListNotifier extends ChangeNotifier {
  Future<List<Habit>> _habits = IsarService().getAllHabits();
  Habit? currentHabit;

  Future<List<Habit>> getHabits() {
    return _habits;
  }

  Habit? getCurrentHabit() {
    return currentHabit;
  }

  void setCurrentHabit(Habit habit) {
    currentHabit = habit;
    notifyListeners();
  }

  void updateCurrentHabit(Habit habit) {
    currentHabit = habit;
    updateHabit(habit);
    _reloadHabitList();
  }

  void createHabit(String name, String progressUnit, int progressGoal) {
    IsarService().saveHabit(Habit(
        name: name,
        progressUnit: progressUnit,
        progressGoal: progressGoal,
        progressValue: 0));
    _reloadHabitList();
  }

  void updateHabit(Habit habit) {
    IsarService().saveHabit(habit);
    _reloadHabitList();
  }

  void deleteHabit(int id) {
    IsarService().deleteHabit(id);
    _reloadHabitList();
  }

  void _reloadHabitList() {
    _habits = IsarService().getAllHabits();
    notifyListeners();
  }
}
