import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'database_service.g.dart';

const taskBoxName = 'tasks';
Random random = Random();

@HiveType(typeId: 0)
class Task extends HiveObject {
  Task(
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.isCompleted,
      required this.dueDate,
      required this.notificationID});
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  DateTime createdAt;
  @HiveField(3)
  bool isCompleted;
  @HiveField(4)
  DateTime? dueDate;
  @HiveField(5)
  final int? notificationID;

  factory Task.create({required String title, required DateTime dueDate}) =>
      Task(
          id: const Uuid().v1(),
          title: title,
          createdAt: DateTime.now(),
          isCompleted: false,
          dueDate: dueDate,
          notificationID: random.nextInt(10000));
}

initalizeDatabaseService() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(taskBoxName);
}

class TaskCRUDMethods {
  final Box<Task> box = Hive.box<Task>(taskBoxName);

  Future<void> createTask({required Task task}) async {
    await box.put(task.id, task);
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: task.notificationID!,
          channelKey: 'basic_channel',
          title: task.title,
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          notificationLayout: NotificationLayout.Default,
          autoDismissible: false,
        ),
        schedule: NotificationCalendar.fromDate(date: task.dueDate!));
  }

  Future<Task?> getTask({required String id}) async {
    return box.get(id);
  }

  Future<void> updateTask({required Task task}) async {
    await task.save();
  }

  Future<void> deleteTask({required id, task}) async {
    await box.delete(id);
    await AwesomeNotifications().dismiss(task.notificationID);
  }

  Future<void> checkTask({required id, required bool isCompleted}) async {
    final task = await getTask(id: id);
    task!.isCompleted = isCompleted;
    if (!isCompleted) {}
    await updateTask(task: task);
  }

  List<Task> getTaskList() {
    final tasks = box.values.toList();
    return tasks;
  }

  bool taskStatus(Task task) {
    return task.isCompleted;
  }
}
