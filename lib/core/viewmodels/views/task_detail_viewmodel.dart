// TODO Implement this library.
import 'package:tasks/core/services/database_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks/app/app.router.dart';
import '../../../app/app.locator.dart';
import '../base_model.dart';
import 'package:intl/intl.dart';


DateTime now = DateTime.now();
String formattedDate = DateFormat('ddd, mmmm').format(now);

class TaskDetailViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();
  String title =  ""; 
  String description =  ""; 
  String dueDate =  "";
  List _tasks = [];
  List get tasks => _tasks;
  void move() {
    _navigationService.navigateTo(Routes.taskDetailScreen)?.then((value) => {
      setBusy(true),
    _tasks = dataStore.getTaskList(),
    setBusy(false)
    });
  }

  TaskDetailViewModel() {
    setBusy(true);
    _tasks = dataStore.getTaskList();
    setBusy(false);
  }


   editTask(id){
    TaskCRUDMethods().deleteTask(id: id);
    _tasks = dataStore.getTaskList();
    notifyListeners();
  }

  checkTask(id, isCompleted){
    TaskCRUDMethods().checkTask(id: id, isCompleted: isCompleted);
    move();
  }
}
  