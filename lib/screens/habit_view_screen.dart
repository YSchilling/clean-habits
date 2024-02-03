import 'package:clean_habits/models/habit_model.dart';
import 'package:clean_habits/provider/HabitListNotifier.dart';
import 'package:clean_habits/screens/habit_editing_screen.dart';
import 'package:clean_habits/widgets/habit_editing_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitViewScreen extends StatelessWidget {
  const HabitViewScreen({super.key, required this.habit});

  final HabitModel habit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Habit"),
        actions: [HabitEditingPopupMenu(habit: habit)],
      ),
      body: HabitViewingForm(habit: habit),
    );
  }
}

class HabitViewingForm extends StatelessWidget {
  const HabitViewingForm({super.key, required this.habit});

  final HabitModel habit;

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(habit.name),
          ],
        ),
      ),
    );
  }
}
