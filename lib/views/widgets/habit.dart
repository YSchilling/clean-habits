import 'package:clean_habits/controllers/habit_list_controller.dart';
import 'package:clean_habits/models/habit.dart';
import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:clean_habits/views/screens/habit_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitListItem extends StatelessWidget {
  const HabitListItem({super.key, required this.habit});

  final Habit habit;

  void _openHabit(
      BuildContext context, HabitListNotifier notifier, Habit habit) {
    notifier.selectHabit(habit);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HabitViewScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) {
        return Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(100, 222, 222, 222),
              ),
              child: ListTile(
                onTap: () => _openHabit(context, notifier, habit),
                title: Text(habit.name),
              ),
            ),
            LinearProgressIndicator(
                value: (HabitListController.getProgressForDay(
                                habit, notifier.selectedDate)
                            ?.progress ??
                        0) /
                    habit.progressGoal)
          ],
        );
      },
    );
  }
}
