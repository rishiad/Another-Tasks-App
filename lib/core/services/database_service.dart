import 'package:flutter/foundation.dart';
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
  await Hive.openBox<Task>(taskBoxName);
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

    Future<void> deleteTask({required id} )async{
    await box.delete(id);
  }

  Future<void> checkTask({required id, required bool isCompleted})async{
    final task = await getTask(id: id);
    task!.isCompleted = isCompleted;
    if (!isCompleted) {
    }
    await updateTask(task: task);
  }

  List<Task> getTaskList()  {
    final tasks =  box.values.toList();
    return tasks;
  }

  bool taskStatus(Task task) {
    return task.isCompleted;
  } 
}