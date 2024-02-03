import 'package:clean_habits/models/habit_model.dart';
import 'package:clean_habits/provider/HabitListNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitEditingScreen extends StatelessWidget {
  const HabitEditingScreen({super.key, required this.habit});

  final HabitModel habit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Habit"),
      ),
      body: HabitEditingForm(habit: habit),
    );
  }
}

class HabitEditingForm extends StatelessWidget {
  HabitEditingForm({super.key, required this.habit});

  final HabitModel habit;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = habit.name;

    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) => Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'required';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  HabitModel updatedHabit =
                      HabitModel(id: habit.id, name: _nameController.text);
                  notifier.updateHabit(updatedHabit);
                  Navigator.pop(context);
                }
              },
              child: const Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}
