import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:Tasks/ui/constants/color_constants.dart';
import 'package:Tasks/ui/widgets/task.dart';
import '../../core/viewmodels/views/init_viewmodel.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitViewModel>.reactive(
      viewModelBuilder: () => InitViewModel(),
      builder: (context, model, child) => Scaffold(
          // make list view

          floatingActionButton: FloatingActionButton(
            onPressed: model.move,
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 20, top: 50),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              children:  <Widget>[
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
               const Task(
                  title: 'Task 1',
                )
              ],
            ),
          )),
    );
  }
}
