import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo/app/app.router.dart';
import '../../../app/app.locator.dart';
import '../base_model.dart';

class InitViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();
  String title = 'Todo View';

  void move() {
    _navigationService.navigateTo(Routes.secondTestScreen);
  }

}
