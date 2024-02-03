import 'package:clean_habits/provider/HabitListNotifier.dart';
import 'package:clean_habits/screens/habit_creation_screen.dart';
import 'package:clean_habits/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HabitListNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
        },
        theme: ThemeData(useMaterial3: true),
      ),
    );
  }
}
