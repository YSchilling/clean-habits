import 'package:clean_habits/controllers/habit_list_notifer.dart';
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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: CreatingHabitForm(),
      ),
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

  ElevatedButton _createSubmitButton(HabitListNotifier notifier) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          notifier.createHabit(
              _nameController.text,
              _progressUnitController.text,
              int.parse(_progressGoalController.text));
          Navigator.pop(context);
        }
      },
      child: const Text('Create'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitListNotifier>(
      builder: (context, notifier, child) => Form(
        key: _formKey,
        child: ListView(
          children: [
            _createTextFormField(_nameController, "Name", defaultValidator),
            _createTextFormField(
                _progressUnitController, "Unit", defaultValidator),
            _createTextFormField(
                _progressGoalController, "Goal", integerValidator),
            _createSubmitButton(notifier),
          ],
        ),
      ),
    );
  }
}
