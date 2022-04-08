import 'package:tasks/core/services/database_service.dart';
import 'package:flutter/material.dart';
class BaseModel extends ChangeNotifier {
  final TaskCRUDMethods dataStore = TaskCRUDMethods();
    bool _busy = false;
    bool get busy => _busy;
    void setBusy(bool value) {
      _busy = value;
      notifyListeners();
    }
}
