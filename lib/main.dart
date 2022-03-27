import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:Tasks/app/app.locator.dart';
import 'package:Tasks/app/app.router.dart';
import 'package:Tasks/ui/constants/color_constants.dart';
import 'ui/views/init_view.dart';
import 'app/app.router.dart';
void main() {
  setupLocator();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConstants.sharkBackgroundColor
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

// make Tasks app