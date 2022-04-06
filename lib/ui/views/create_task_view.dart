import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../core/viewmodels/views/task_detail_viewmodel.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskDetailViewModel>.reactive(
      viewModelBuilder: () => TaskDetailViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: model.move),
          body: Center(
            child: Text(model.title),
          )),
    );
  }
}
