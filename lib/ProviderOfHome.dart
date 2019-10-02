
import 'package:flutter/material.dart';

class ProviderOfHome extends ChangeNotifier {
  int _index=0;
  bool _boolTheme=false;
//  String lang;
//
  ProviderOfHome();

  getBoolTheme() => _boolTheme;

  getIndex() => _index;

  setIndex(int index) {
    _index = index;
    notifyListeners();
  }

  void changeBoolTheme() {
    _boolTheme=!_boolTheme;
    notifyListeners();
  }

}
