import 'package:clean_habits/models/habit.dart';
import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitEditingScreen extends StatelessWidget {
  const HabitEditingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Habit"),
      ),
      body: HabitEditingForm(),
    );
  }
}

class HabitEditingForm extends StatelessWidget {
  HabitEditingForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _progressUnitController = TextEditingController();
  final _progressGoalController = TextEditingController();

  void _initController(Habit habit) {
    _nameController.text = habit.name;
    _progressUnitController.text = habit.progressUnit;
    _progressGoalController.text = habit.progressGoal.toString();
  }

  ElevatedButton _createSubmitButton(
      HabitListNotifier notifier, BuildContext context) {
    return ElevatedButton(
        child: const Text("Submit"),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Habit updatedHabit = notifier.getCurrentHabit()!;
            updatedHabit.name = _nameController.text;
            updatedHabit.progressUnit = _progressUnitController.text;
            updatedHabit.progressValue = 0;
            updatedHabit.progressGoal = int.parse(_progressGoalController.text);

            notifier.updateCurrentHabit(updatedHabit);
            Navigator.pop(context);
          }
        });
  }

  TextFormField _createTextFormField(
    TextEditingController controller,
    String hint,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }

  String? defaultValidator(value) {
    if (value == null || value.isEmpty) {
      return 'required';
    }
    return null;
  }

  String? integerValidator(value) {
    if (value == null || value.isEmpty) {
      return 'required';
    }
    var parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      return 'must be a whole number!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) {
        _initController(notifier.getCurrentHabit()!);
        return Form(
          key: _formKey,
          child: ListView(
            children: [
              _createTextFormField(_nameController, "Name", defaultValidator),
              _createTextFormField(
                  _progressUnitController, "Unit", defaultValidator),
              _createTextFormField(
                  _progressGoalController, "Goal", integerValidator),
              _createSubmitButton(notifier, context),
            ],
          ),
        );
      },
    );
  }
}
