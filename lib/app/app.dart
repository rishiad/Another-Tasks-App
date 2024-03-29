import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks/ui/views/init_view.dart';
import 'package:tasks/ui/views/create_task_view.dart';

@StackedApp(
  routes: [
  MaterialRoute(page: InitScreen, initial: true),
  MaterialRoute(page: TaskDetailScreen),
],
  dependencies: [
    LazySingleton( classType: NavigationService),
    LazySingleton( classType: DialogService),
  ]
)
class AppSetup {}
