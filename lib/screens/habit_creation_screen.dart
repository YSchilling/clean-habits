import 'package:clean_habits/models/database.dart';
import 'package:clean_habits/provider/HabitListNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitCreationScreen extends StatelessWidget {
  const HabitCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Habit"),
      ),
      body: const CreatingHabitForm(),
    );
  }
}

class CreatingHabitForm extends StatefulWidget {
  const CreatingHabitForm({super.key});

  @override
  State<CreatingHabitForm> createState() => _CreatingHabitFormState();
}

class _CreatingHabitFormState extends State<CreatingHabitForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _progressUnitController = TextEditingController();
  final _progressGoalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              controller: _progressUnitController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'required';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _progressGoalController,
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
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  notifier.addHabit(
                      _nameController.text,
                      _progressUnitController.text,
                      0,
                      int.parse(_progressGoalController.text));
                  Navigator.pop(context);
                }
              },
              child: const Text('Create'),
            )
          ],
        ),
      ),
    );
  }
}
