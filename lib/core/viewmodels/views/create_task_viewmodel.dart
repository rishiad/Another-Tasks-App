import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks/core/models/category_model.dart';
import 'package:tasks/core/models/task_model.dart';
import 'package:tasks/ui/views/create_task_view.form.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../services/database_service.dart';

class TaskDetailViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  String title = 'Create Task Page';
  String selectedCategory = "";
  final List _categories = [
    "Work",
    "Home",
    "School",
    "Grocery",
  ];


  List get categories => _categories;
  void move() {
    _navigationService.navigateTo(Routes.initScreen);
  }

  @override
  void setFormStatus() {
    // ignore: todo
    // TODO: implement setFormStatus
  }

  addTask()  {
    DateTime parseDate = DateFormat("yyyy-MM-dd").parse(dueDateValue!);
    var task;
     CategoryCRUDMethods().createCategory(category: Category.create(title: selectedCategory)).then((value)async => {
    task = Task.create(title: titleValue ?? "", dueDate: parseDate, categoryID: value.id, categoryTitle: value.title),
    await TaskCRUDMethods().createTask(task: task),

     CategoryCRUDMethods().addTaskToCategory(categoryID: value.id, task: task),
      move()
   });
}
}