import 'package:clean_habits/controllers/habit_list_controller.dart';
import 'package:clean_habits/models/habit.dart';
import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> showProgressAdderDialogue(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final progressController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      return Consumer<HabitListNotifier>(
        builder: (context, notifier, child) => Form(
          key: formKey,
          child: AlertDialog(
            title: const Text("Add progress to habit"),
            content: TextFormField(
              controller: progressController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'required';
                }
                var parsedValue = int.tryParse(value);
                if (parsedValue == null) {
                  return 'must be a whole number!';
                }
                return null;
              },
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Habit habit = notifier.getSelectedHabit()!;
                    int oldProgress = (HabitListController.getProgressForDay(
                                habit, notifier.selectedDate)
                            ?.progress ??
                        0);
                    HabitListController.saveProgressForDay(
                        habit,
                        notifier.selectedDate,
                        oldProgress + int.parse(progressController.text));
                    notifier.updateSelectedHabit(habit);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              )
            ],
          ),
        ),
      );
    },
  );
}
