import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:clean_habits/helper/get_weekday_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeekProgressBar extends StatelessWidget {
  WeekProgressBar({super.key});

  final weekDates = getWeekDays(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          7,
          (index) => Day(notifier: notifier, date: weekDates[index]),
        ),
      ),
    );
  }
}

class Day extends StatelessWidget {
  const Day({super.key, required this.date, required this.notifier});

  final DateTime date;
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

  bool isToday() {
    DateTime today = DateTime.now();
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }

  bool isSelected() {
    DateTime selected = notifier.selectedDate;
    return date.year == selected.year &&
        date.month == selected.month &&
        date.day == selected.day;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => notifier.updateSelectedDate(date),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: isSelected()
            ? BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)))
            : null,
        child: Column(
          children: [
            Text(weekdayToString(date.weekday - 1) ?? "ERR",
                style: isToday()
                    ? TextStyle(color: Theme.of(context).primaryColor)
                    : null),
            const SizedBox(height: 8.0),
            Stack(
              alignment: Alignment.center,
              children: [
                const CircularProgressIndicator(value: 1.0),
                Text(date.day.toString())
              ],
            )
          ],
        ),
      ),
    );
  }
}
