import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  var _count = 10;
  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}