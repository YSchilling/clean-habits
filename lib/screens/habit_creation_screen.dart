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
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  notifier.addHabit(_nameController.text);
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
