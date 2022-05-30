import 'package:flutter/cupertino.dart';

class CounterModel extends ChangeNotifier{
  bool _isDark = true;

  bool getIsDark() {
    return _isDark;
  }

  toggle(){
    _isDark = !_isDark;
    notifyListeners();
  }
}