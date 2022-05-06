 import 'package:tasks/core/models/task_model.dart';
 
 class CreateTask extends Equatable {
     const CreateTask({
         required this.name,
         required this.categoryID,
         required this.dueDate,
         required this.priorityId,
         this.notes,
         this.subTask 
     });

     final String name;
     final String categoryID;
     final DateTime dueDate;
     final int priorityId;
     final String? notes; 
     final Task? subTask;

    CreateTask.copyWith({
                required String name, required String categoryId, 
                required DateTime dueDate, int? priorityId,
                String? notes, Task? subTask
                }) {
                    return CreateTask(
                        name: name,
                        categoryID: categoryId,
                        dueDate: dueDate,
                        priorityId: priorityId,
                        notes : notes,
                        subTask : [subtask]
                        );
                    }

    @override
    List<Object> get props => [name, categoryId, dueDate, priorityId, notes, subTask];
 }