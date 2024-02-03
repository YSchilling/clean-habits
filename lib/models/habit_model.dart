import 'package:flutter/material.dart';

class HabitModel {
  int id;
  String name;
  String progressUnit;
  int progressValue;
  int progressGoal;

  HabitModel(
      {required this.id,
      required this.name,
      required this.progressUnit,
      required this.progressValue,
      required this.progressGoal});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'progressUnit': progressUnit,
      'progressValue': progressValue,
      'progressGoal': progressGoal
    };
  }
}
