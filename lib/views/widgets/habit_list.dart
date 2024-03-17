import 'package:clean_habits/models/database.dart';
import 'package:clean_habits/models/habit.dart';
import 'package:clean_habits/views/widgets/habit.dart';
import 'package:flutter/material.dart';

class HabitList extends StatelessWidget {
  const HabitList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: IsarService().listenToHabits(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        List<Habit> habits = snapshot.data!;
        debugPrint("Fetched habits: $habits");
        return ListView.builder(
          itemCount: habits.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: HabitListItem(habit: habits[index]),
          ),
        );
      },
    );
  }
}
