import 'package:clean_habits/models/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveHabit(Habit newHabit) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.habits.putSync(newHabit));
  }

  Future<List<Habit>> getAllHabits() async {
    final isar = await db;
    return await isar.habits.where().findAll();
  }

  Stream<List<Habit>> listenToHabits() async* {
    final isar = await db;
    yield* isar.habits.where().watch(fireImmediately: true);
  }

  Future<void> deleteHabit(int id) async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.habits.delete(id));
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [HabitSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
