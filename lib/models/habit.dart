import 'package:isar/isar.dart';

part 'habit.g.dart';

@collection
class Habit {
  Id id = Isar.autoIncrement;
  String name;
  String progressUnit;
  int progressGoal;
  int progressValue;

  Habit(
      {required this.name,
      required this.progressUnit,
      required this.progressGoal,
      required this.progressValue});
}
