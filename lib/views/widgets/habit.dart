import 'package:clean_habits/models/habit_model.dart';
import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:clean_habits/views/screens/habit_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Habit extends StatelessWidget {
  const Habit({super.key, required this.habit});

  final HabitModel habit;

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) {
        notifier.setCurrentHabit(habit);

        return Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(100, 222, 222, 222),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HabitViewScreen(),
                    ),
                  );
                },
                title: Text(habit.name),
              ),
            ),
            LinearProgressIndicator(
              value: habit.progressValue / habit.progressGoal,
            ),
          ],
        );
      },
    );
  }
}
