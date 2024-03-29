import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/core/models/category_model.dart';
import 'package:tasks/core/models/task_model.dart';
import 'package:uuid/uuid.dart';
part 'database_service.g.dart';

const taskBoxName = 'tasks';
const categoryBoxName = 'categories';
Random random = Random();


initalizeDatabaseService() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(CategoryAdapter());
  await Hive.openBox<Task>(taskBoxName);
  await Hive.openBox<Category>(categoryBoxName);
}

genrateRandomColor()async {
  return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
class TaskCRUDMethods {
  final Box<Task> box = Hive.box<Task>(taskBoxName);

  Future<void> createTask({required Task task}) async {
    await box.put(task.id, task);
    print(task.categoryTitle);
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: task.notificationID!,
          channelKey: 'todo_notification_channel',
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

class CategoryCRUDMethods {
  final Box<Category> box = Hive.box<Category>(categoryBoxName);

  Future<Category> createCategory({required Category category}) async {
    await box.put(category.id, category);
    return category;
  }

  Future<Category?> getCategory({required String id}) async {
    return box.get(id);
  }

  Future<void> updateCategory({required Category category}) async {
    await category.save();
  }

  Future<void> deleteCategory({required id, task}) async {
    await box.delete(id);
  }

  List<Category> getCategoryList() {
    final categories = box.values.toList();
    return categories;
  }

  Future<void> addTaskToCategory({required String categoryID, required Task task}) async {
    final category = await getCategory(id: categoryID);
    category!.taskIds.add(task.id);
    await updateCategory(category: category);
  }

  getCategoryOfATask({required String taskID}) async {
    final task = await TaskCRUDMethods().getTask(id: taskID);
    final category = await getCategory(id: task?.categoryID ?? "");
    return category;
  }
}
