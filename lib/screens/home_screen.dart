import 'package:clean_habits/provider/HabitListNotifier.dart';
import 'package:clean_habits/screens/habit_creation_screen.dart';
import 'package:clean_habits/widgets/habit.dart';
import 'package:flutter/material.dart';
import 'package:clean_habits/widgets/habit_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HabitList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HabitCreationScreen())),
      ),
    );
  }
}
