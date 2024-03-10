import 'package:clean_habits/models/habit.dart';
import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:clean_habits/views/widgets/habit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitList extends StatefulWidget {
  const HabitList({super.key});

  @override
  State<HabitList> createState() => _HabitListState();
}

class _HabitListState extends State<HabitList> {
  Widget _createListView(List<Habit> habits) {
    return ListView.separated(
      itemCount: habits.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return HabitListItem(habit: habits[index]);
      },
    );
  }

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
              final List<Habit> habits = snapshot.data!;
              return RefreshIndicator(
                onRefresh: () {
                  setState(() {});
                  return Future(() {});
                },
                child: _createListView(habits),
              );
            },
          );
        },
      ),
    );
  }
}
