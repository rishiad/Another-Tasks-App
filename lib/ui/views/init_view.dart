import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';
import '../widgets/checkbox.dart';
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
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              children: const <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Todo',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                ),
                CheckboxWidget()
              ],
            ),
          )),
    );
  }
}
