import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../core/viewmodels/views/init_viewmodel.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitViewModel>.reactive(
          viewModelBuilder: () => InitViewModel(),
          builder: (context, model, child) => Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: model.move,
            ),
            
                body: Center(
                      child: Text(model.title),
                    )
              ),
              
        );
  }
}
