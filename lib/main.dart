import 'package:tasks/core/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks/app/app.locator.dart';
import 'package:tasks/app/app.router.dart';
import 'package:tasks/ui/constants/color_constants.dart';
import 'app/app.router.dart';
void main() async {
  setupLocator();
  await initalizeDatabaseService();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 
  
 @override
  Widget build(BuildContext context) {
  // TaskCRUDMethods().createTask(task: Task.create(title: "test 5"));
  final newTextTheme = Theme.of(context).textTheme.apply(
  bodyColor: const Color.fromARGB(255, 208, 208, 208),  
);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tasks',
      theme: ThemeData(
        textTheme: newTextTheme,
        scaffoldBackgroundColor: ColorConstants.sharkBackgroundColor,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

// make tasks app