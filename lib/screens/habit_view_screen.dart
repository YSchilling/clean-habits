import 'package:clean_habits/models/habit_model.dart';
import 'package:clean_habits/provider/HabitListNotifier.dart';
import 'package:clean_habits/widgets/habit_editing_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitViewScreen extends StatefulWidget {
  const HabitViewScreen({super.key, required this.habit});

  final HabitModel habit;

  @override
  State<HabitViewScreen> createState() => _HabitViewScreenState();
}

class _HabitViewScreenState extends State<HabitViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habit.name),
        actions: [HabitEditingPopupMenu(habit: widget.habit)],
      ),
      body: HabitViewingForm(habit: widget.habit),
      bottomNavigationBar: BottomAppBar(
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    widget.habit.progressValue += 1;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
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
