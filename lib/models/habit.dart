import 'package:isar/isar.dart';

part 'habit.g.dart';

@collection
class Habit {
  Id id = Isar.autoIncrement;
  String name;
  String progressUnit;
  int progressGoal;
  final progressDays = IsarLinks<DayProgress>();

  Habit(
      {required this.name,
      required this.progressUnit,
      required this.progressGoal});
}

@collection
class DayProgress {
  Id id = Isar.autoIncrement;
  int year;
  int month;
  int day;
  int progress;

  @Backlink(to: "progressDays")
  final habit = IsarLink<Habit>();

  DayProgress({
    required this.year,
    required this.month,
    required this.day,
    required this.progress,
  });
}
