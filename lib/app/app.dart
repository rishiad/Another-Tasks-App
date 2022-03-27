import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:Tasks/ui/views/init_view.dart';
import 'package:Tasks/ui/views/task_detail_view.dart';

@StackedApp(
  routes: [
  MaterialRoute(page: InitScreen, initial: true),
  MaterialRoute(page: TaskDetailScreen),
],
  dependencies: [
    LazySingleton( classType: NavigationService),
  ]
)
class AppSetup {}
