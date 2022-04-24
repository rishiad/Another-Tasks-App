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
      required this.notificationID, 
      required this.categoryID,
      required this.categoryTitle,
      required this.notes});
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
  @HiveField(6)
  String categoryID;
  @HiveField(7)
  String categoryTitle;
  @HiveField(8)
  String notes;

  factory Task.create({required String title, required DateTime dueDate, required String categoryID, required String categoryTitle, notes}) =>
      Task(
          id: const Uuid().v1(),
          title: title,
          createdAt: DateTime.now(),
          isCompleted: false,
          dueDate: dueDate,
          notificationID: random.nextInt(10000),
          categoryID: categoryID,
          categoryTitle: categoryTitle,
          notes: notes?? "");
}