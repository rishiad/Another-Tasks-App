import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks/ui/views/create_task_view.form.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../services/database_service.dart';

class TaskDetailViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  String title = 'Create Task Page';
  void move() {
    _navigationService.navigateTo(Routes.initScreen);
  }

  @override
  void setFormStatus() {
    // ignore: todo
    // TODO: implement setFormStatus
  }

  addTask() {
    DateTime parseDate = DateFormat("yyyy-MM-dd").parse(dueDateValue!);
    TaskCRUDMethods().createTask(task: Task.create(title: titleValue ?? "", dueDate: parseDate));
}
}