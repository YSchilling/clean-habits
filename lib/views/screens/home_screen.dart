import 'package:clean_habits/controllers/habit_list_notifer.dart';
import 'package:clean_habits/views/screens/habit_creation_screen.dart';
import 'package:clean_habits/views/widgets/week_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:clean_habits/views/widgets/habit_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer<HabitListNotifier>(
              builder: (context, value, child) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(child: Text(value.getSelectedDateString()))),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
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
