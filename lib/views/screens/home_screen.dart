import 'package:clean_habits/views/screens/habit_creation_screen.dart';
import 'package:clean_habits/views/widgets/week_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:clean_habits/views/widgets/habit_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: WeekProgressBar(),
            ),
            const Expanded(child: HabitList()),
          ],
        ),
      ),
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
