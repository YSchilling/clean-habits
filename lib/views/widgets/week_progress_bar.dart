import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:clean_habits/helper/get_weekday_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeekProgressBar extends StatelessWidget {
  const WeekProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) => SizedBox(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            7,
            (index) => Day(notifier: notifier, weekday: index),
          ),
        ),
      ),
    );
  }
}

class Day extends StatelessWidget {
  const Day({super.key, required this.weekday, required this.notifier});

  final int weekday;
  final HabitListNotifier notifier;

  String? weekdayToString(int weekday) {
    return {
      0: "Mon",
      1: "Tue",
      2: "Wed",
      3: "Thu",
      4: "Fri",
      5: "Sat",
      6: "Sun"
    }[weekday];
  }

  DateTime weekdayToDate(int weekday) {
    return getWeekDays(DateTime.now())[weekday];
  }

  void updateDate() {
    DateTime date = getWeekDays(DateTime.now())[weekday];
    notifier.updateSelectedDate(date);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => updateDate(),
      child: Column(
        children: [
          Text(weekdayToString(weekday) ?? "ERR"),
          const SizedBox(height: 8.0),
          const CircularProgressIndicator(value: 1.0),
        ],
      ),
    );
  }
}
