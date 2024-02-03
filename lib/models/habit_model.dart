import 'package:flutter/material.dart';

class HabitModel {
  int id;
  String name;

  HabitModel({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
