import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  var _count = 5;
  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}