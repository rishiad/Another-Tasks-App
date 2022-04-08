import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks/ui/views/task_detail_view.form.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../services/database_service.dart';
import '../base_model.dart';

class TaskDetailViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  String title = 'Task Detail Page';
  void move() {
    _navigationService.navigateTo(Routes.initScreen);
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  addTask() {
    print(titleValue);
    TaskCRUDMethods().createTask(task: Task.create(title: titleValue ?? ""));
  }
}
