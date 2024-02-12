import 'package:clean_habits/models/habit_model.dart';
import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:clean_habits/views/widgets/habit_editing_popup_menu.dart';
import 'package:clean_habits/views/widgets/habit_progress_adder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitViewScreen extends StatefulWidget {
  const HabitViewScreen({super.key});

  @override
  State<HabitViewScreen> createState() => _HabitViewScreenState();
}

class _HabitViewScreenState extends State<HabitViewScreen> {
  void _resetProgress(HabitListNotifier notifier) {
    HabitModel habit = notifier.getCurrentHabit()!;
    habit.progressValue = 0;
    notifier.updateCurrentHabit(habit);
  }

  BottomAppBar _createBottomAppBar(HabitListNotifier notifier) {
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
      HabitModel habit = notifier.currentHabit!;
      return Scaffold(
        appBar: AppBar(
          title: Text(habit.name),
          actions: const [HabitEditingPopupMenu()],
        ),
        body: HabitViewingForm(habit: habit),
        bottomNavigationBar: _createBottomAppBar(notifier),
      );
    });
  }
}

class HabitViewingForm extends StatelessWidget {
  const HabitViewingForm({super.key, required this.habit});

  final HabitModel habit;

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
                  value: habit.progressValue / habit.progressGoal,
                ),
                Center(
                  child: Text(habit.progressValue.toString()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
