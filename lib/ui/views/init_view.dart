import 'package:flutter/material.dart';
import 'package:stacked/stacked';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitViewModel>.reactive(
          builder: (context, model, child) => Scaffold(
                body: Center(
      
                    )
              )
        )
  }
}
