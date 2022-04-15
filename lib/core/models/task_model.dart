import 'package:hive/hive.dart';
import 'package:tasks/core/services/database_service.dart';
import 'package:uuid/uuid.dart';

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