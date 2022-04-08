import 'package:tasks/core/services/database_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks/app/app.router.dart';
import '../../../app/app.locator.dart';
import '../base_model.dart';
import 'package:intl/intl.dart';


DateTime now = DateTime.now();
String formattedDate = DateFormat('ddd, mmmm').format(now);

class InitViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();
  final String _title =  DateFormat.MMMMd().format(DateTime.now()); 
  List _tasks = [];
  String get title => _title;
  List get tasks => _tasks;
  int _counter = 0;
  void move() {
    _navigationService.navigateTo(Routes.taskDetailScreen)?.then((value) => {
      setBusy(true),
    _tasks = dataStore.getTaskList(),
    setBusy(false)
    });
  }

  InitViewModel() {
    setBusy(true);
    _tasks = dataStore.getTaskList();
    setBusy(false);
  }

  void addTask(){
    _counter++;
    TaskCRUDMethods().createTask(task: Task.create(title: "test $_counter"));
    _tasks = dataStore.getTaskList();
    notifyListeners();
  }

   deleteTask(id){
    TaskCRUDMethods().deleteTask(id: id);
    _tasks = dataStore.getTaskList();
    notifyListeners();
  }

  checkTask(id, isCompleted){
    TaskCRUDMethods().checkTask(id: id, isCompleted: isCompleted);
    _tasks = dataStore.getTaskList();
    notifyListeners();
  }
}
  