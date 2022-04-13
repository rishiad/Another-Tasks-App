import 'package:tasks/core/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks/app/app.locator.dart';
import 'package:tasks/app/app.router.dart';
import 'package:tasks/ui/constants/color_constants.dart';
import 'app/app.router.dart';
import 'package:awesome_notifications/awesome_notifications.dart';


void main() async {
  AwesomeNotifications().initialize(
  // set the icon to null if you want to use the default app icon
  'resource://drawable/logo',
  [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color.fromARGB(255, 177, 177, 177),
        ledColor: Colors.white)
  ],
  // Channel groups are only visual and are not required
  channelGroups: [
    NotificationChannelGroup(
        channelGroupkey: 'basic_channel_group',
        channelGroupName: 'Basic group')
  ],
  debug: true
);
  setupLocator();
  await initalizeDatabaseService();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key); 

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   final _dialogService = locator<DialogService>();
  @override
  void initState() {
    super.initState();
     
      Future showBasicDialog() async {
    // ignore: unused_local_variable
    DialogResponse? response = await _dialogService.showDialog(
      title: 'Allow notifications',
      description:
          'We need to send you notifications. Would you like to allow them?',
      buttonTitle: 'Yes',
      dialogPlatform: DialogPlatform.Material,
      cancelTitle: 'Cancel',
    );
  }
    AwesomeNotifications().isNotificationAllowed().then((isAllowed)async {
  if (!isAllowed) {
    await showBasicDialog();
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
});
  }
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