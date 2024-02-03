import 'package:clean_habits/models/habit_model.dart';
import 'package:clean_habits/provider/HabitListNotifier.dart';
import 'package:clean_habits/widgets/habit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitList extends StatefulWidget {
  const HabitList({super.key});

  @override
  State<HabitList> createState() => _HabitListState();
}

class _HabitListState extends State<HabitList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Consumer<HabitListNotifier>(
        builder: (context, notifier, child) {
          return FutureBuilder(
            future: notifier.getHabits(),
            builder: (context, snapshot) {
              debugPrint(snapshot.data.toString());
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final List<HabitModel> habits = snapshot.data!;
              return RefreshIndicator(
                onRefresh: () {
                  setState(() {});
                  return Future(() {});
                },
                child: ListView.separated(
                  itemCount: habits.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    return Habit(habit: habits[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
