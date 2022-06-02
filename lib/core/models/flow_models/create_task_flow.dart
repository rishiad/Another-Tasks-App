 import 'package:tasks/core/models/task_model.dart';
 
 class CreateTask {
     const CreateTask({
         required this.name,
         required this.categoryID,
         required this.dueDate,
         required this.priorityId,
         this.notes,
         this.subTasks 
     });

     final String name;
     final String categoryID;
     final DateTime dueDate;
     final int priorityId;
     final String? notes; 
     final List<Task>? subTasks;

    factory CreateTask.copyWith({
                required String name, required String categoryId, 
                required DateTime dueDate, required int priorityId,
                String? notes, Task? subTask
                }) {
                    return CreateTask(
                        name: name,
                        categoryID: categoryId,
                        dueDate: dueDate,
                        priorityId: priorityId,
                        notes : notes,
                        subTasks : [subTask!]
                        );
                    }

    @override
    List<Object> get props => [name, categoryID, dueDate, priorityId, notes!, subTasks!];
 }