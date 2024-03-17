import 'package:clean_habits/controllers/habit_list_controller.dart';
import 'package:clean_habits/models/habit.dart';
import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:clean_habits/views/widgets/habit_editing_popup_menu.dart';
import 'package:clean_habits/views/widgets/habit_progress_adder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitViewScreen extends StatelessWidget {
  const HabitViewScreen({super.key});

  void _resetProgress(HabitListNotifier notifier) {
    Habit habit = notifier.getSelectedHabit()!;
    HabitListController.saveProgressForDay(habit, notifier.selectedDate, 0);
    notifier.updateSelectedHabit(habit);
  }

  BottomAppBar _createBottomAppBar(
      BuildContext context, HabitListNotifier notifier) {
    return BottomAppBar(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () => _resetProgress(notifier),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showProgressAdderDialogue(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(builder: (context, notifier, child) {
      Habit habit = notifier.selectedHabit!;
      return Scaffold(
        appBar: AppBar(
          title: Text(habit.name),
          actions: const [HabitEditingPopupMenu()],
        ),
        body: HabitViewingForm(habit: habit),
        bottomNavigationBar: _createBottomAppBar(context, notifier),
      );
    });
  }
}

class HabitViewingForm extends StatelessWidget {
  const HabitViewingForm({super.key, required this.habit});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: SizedBox(
          width: 256,
          height: 256,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                  backgroundColor: Colors.black12,
                  value: (HabitListController.getProgressForDay(
                                  habit, notifier.selectedDate)
                              ?.progress ??
                          0) /
                      habit.progressGoal),
              Center(
                child: Text((HabitListController.getProgressForDay(
                                habit, notifier.selectedDate)
                            ?.progress ??
                        0)
                    .toString()),
              )
            ],
          ),
        )),
      ),
    );
  }
}
