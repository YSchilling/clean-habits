import 'package:clean_habits/controllers/habit_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:clean_habits/models/habit.dart';

class HabitListNotifier extends ChangeNotifier {
  Habit? selectedHabit;
  DateTime selectedDate = DateTime.now();

  void selectHabit(Habit habit) {
    selectedHabit = habit;
    notifyListeners();
  }

  Habit? getSelectedHabit() {
    return selectedHabit;
  }

  void updateSelectedHabit(Habit habit) {
    selectedHabit = habit;
    HabitListController.updateHabit(habit);
    notifyListeners();
  }

  void unselectHabit() {
    selectedHabit = null;
    notifyListeners();
  }

  String getSelectedDateString() {
    return "${selectedDate.day}.${selectedDate.month}.${selectedDate.year}";
  }

  void updateSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
