import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tasks/core/services/database_service.dart';
import 'package:uuid/uuid.dart';

@HiveType(typeId: 1)
class Category extends HiveObject {
  Category(
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.color,
      required tasksIds
});
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  DateTime createdAt;
  @HiveField(3)
  String color;
  @HiveField(4)
  List<String> taskIds = [];



  factory Category.create({required String title}) =>
      Category(
          id: const Uuid().v1(),
          title: title,
          createdAt: DateTime.now(),
          color: Colors.amber.value.toRadixString(16),
          tasksIds: []
);  
}