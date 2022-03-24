import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo/app/app.locator.dart';
import 'package:todo/app/app.router.dart';
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
      title: 'Todo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

// make todo app