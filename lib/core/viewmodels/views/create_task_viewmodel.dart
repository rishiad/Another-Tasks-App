import 'package:flutter/foundation.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../base_model.dart';

class CreateTaskViewModel extends BaseModel {
    final _navigationService = locator<NavigationService>();

  String title = 'Task Detail Page';
    void move() {
    _navigationService.navigateTo(Routes.initScreen);
    if (kDebugMode) {
      print(dataStore);
    }
  }
  

}
