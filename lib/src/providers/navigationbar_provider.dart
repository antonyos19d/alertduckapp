import 'package:flutter/cupertino.dart';

class NavigationBarProvider extends ChangeNotifier {
  int _selectMenuOpt = 0;

  int get SelectMenuOpt {
    return this._selectMenuOpt;
  }

  set SelectMenuOpt(int i) {
    this._selectMenuOpt = i;
    notifyListeners();
  }
}
