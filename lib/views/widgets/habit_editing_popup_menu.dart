import 'package:clean_habits/models/habit.dart';
import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:clean_habits/views/screens/habit_editing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitEditingPopupMenu extends StatefulWidget {
  const HabitEditingPopupMenu({super.key});

  @override
  State<HabitEditingPopupMenu> createState() => _HabitEditingPopupMenuState();
}

class _HabitEditingPopupMenuState extends State<HabitEditingPopupMenu> {
  void _editHabit(HabitListNotifier notifier, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HabitEditingScreen()));
  }

  void _deleteHabit(HabitListNotifier notifier, BuildContext context) {
    Habit habit = notifier.getCurrentHabit()!;
    notifier.deleteHabit(habit.id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) => PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: const Text('edit'),
            onTap: () => _editHabit(notifier, context),
          ),
          PopupMenuItem(
            child: const Text('delete'),
            onTap: () => _deleteHabit(notifier, context),
          )
        ],
      ),
    );
  }
}
