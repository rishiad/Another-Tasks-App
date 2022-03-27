import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:Tasks/app/app.router.dart';
import '../../../app/app.locator.dart';
import '../base_model.dart';
import 'package:intl/intl.dart';


DateTime now = DateTime.now();
String formattedDate = DateFormat('ddd, mmmm').format(now);

class InitViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  final String _title =  DateFormat.MMMMd()  
               
              // displaying formatted date
              .format(DateTime.now()); 
  String get title => _title;
  void move() {
    _navigationService.navigateTo(Routes.secondTestScreen);
  }

    // get today's day and month as text
    // and set it to the title
    // Eg: "Today is Monday, May"



}
  