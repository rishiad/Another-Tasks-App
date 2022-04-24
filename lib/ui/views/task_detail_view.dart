import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasks/ui/constants/color_constants.dart';
import '../../core/viewmodels/views/task_detail_viewmodel.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskDetailViewModel>.reactive(
      viewModelBuilder: () => TaskDetailViewModel(),
      builder: (context, model, child) => Scaffold(
              body: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [
                      TextButton.icon(
                          onPressed: (() => {Navigator.pop(context)}),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text("To go back")),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Text(model.title,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900)),
                    ],
                  ),
                  Divider(
                    color: Colors.white.withOpacity(.08),
                    thickness: 2,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Row(
                    children: [
                    const Padding(padding: EdgeInsets.only(top: 300)),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    Flexible(
child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.all(15)),

                            // Add Task Description
                            Text(
                              model.description,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                            ),
                            const Padding(padding: EdgeInsets.all(15)),
                            // Add Task Due Date
                            RichText(
                              text: TextSpan(
                                children: [
                                        WidgetSpan(
                                    child: Icon(Icons.add, size: 14),
                                  ),
                                  TextSpan(
                                    text: model.dueDate,
                                  )
                                ],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(15)),
                          ],
                          ),
                    )],
),
                  ],
                )
                )
                );
  }
}
