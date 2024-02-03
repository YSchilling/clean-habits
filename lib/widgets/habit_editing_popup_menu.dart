import 'package:clean_habits/models/habit_model.dart';
import 'package:clean_habits/provider/HabitListNotifier.dart';
import 'package:clean_habits/screens/habit_editing_screen.dart';
import 'package:clean_habits/screens/habit_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitEditingPopupMenu extends StatefulWidget {
  const HabitEditingPopupMenu({super.key, required this.habit});

  final HabitModel habit;

  @override
  State<HabitEditingPopupMenu> createState() => _HabitEditingPopupMenuState();
}

class _HabitEditingPopupMenuState extends State<HabitEditingPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) => PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: const Text('edit'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HabitEditingScreen(habit: widget.habit),
              ),
            ),
          ),
          PopupMenuItem(
            child: const Text('delete'),
            onTap: () {
              notifier.deleteHabit(widget.habit.id);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
