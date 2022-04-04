import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'database_service.g.dart';

const taskBoxName = 'tasks';

@HiveType(typeId:  0)
class Task extends HiveObject{
  Task(
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.isCompleted});
@HiveField(0)
  final String id;
@HiveField(1)
    String title;
@HiveField(2)
    DateTime createdAt;
@HiveField(3)
    bool isCompleted;

  factory Task.create({required String title, DateTime? createdAt}) => Task(
      id: const Uuid().v1(),
      title: title,
      createdAt: createdAt ?? DateTime.now(),
      isCompleted: false);
}

initalizeDatabaseService() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());  
  await Hive.openBox(taskBoxName);
}

class TaskCRUDMethods {
  final Box<Task> box = Hive.box<Task>(taskBoxName);

  Future<void> createTask({required Task task})async{
    await box.put(task.id, task);
  }

  Future<Task?> getTask({required String id})async{
    return box.get(id);
  }

  Future<void> updateTask({required Task task})async{
    await task.save();
  }

    Future<void> deleteTask({required Task task})async{
    await task.delete();
  }

  ValueListenable<Box<Task>> listenToTask() {
    return box.listenable();
  }
}

// createTask(String taskName, String category) async {
//   final box = await Hive.openBox(task);
//   box.put(taskName, false);
// }

// createNestedTask(String taskName, String nestedTaskName) async {
//   final box = await Hive.openBox(task);
//   box.put(taskName, nestedTaskName);
// }

// getListOfTasks() async {
//   final box = await Hive.openBox(task);
//   return box.keys.toList();
// }

// getNestedTask(String taskName) async {
//   final box = await Hive.openBox(task);
//   return box.get(taskName);
// }

// deleteTask(String taskName) async {
//   final box = await Hive.openBox(task);
//   box.delete(taskName);
// }

// deleteNestedTask(String taskName, String nestedTaskName) async {
//   final box = await Hive.openBox(task);
//   box.delete(nestedTaskName);
// }
