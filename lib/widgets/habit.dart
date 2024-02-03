import 'package:clean_habits/models/habit_model.dart';
import 'package:clean_habits/screens/habit_editing_screen.dart';
import 'package:clean_habits/screens/habit_view_screen.dart';
import 'package:flutter/material.dart';

class Habit extends StatelessWidget {
  const Habit({super.key, required this.habit});

  final HabitModel habit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(100, 200, 200, 200)),
          child: ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HabitViewScreen(habit: habit),
              ),
            ),
            title: Text(habit.name),
          ),
        ),
        LinearProgressIndicator(
          value: habit.progressValue / habit.progressGoal,
        ),
      ],
    );
  }
}
