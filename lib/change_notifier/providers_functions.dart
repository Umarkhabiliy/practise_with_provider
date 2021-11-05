import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  int _currentIndex = 0;
  double _slideIndex = 2.0;
  bool _toggle = false;
  get currentIndex => _currentIndex;
  set setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  get sliderIndex => _slideIndex;
  set setslide(double index) {
    _slideIndex = index;
    notifyListeners();
  }
get toggle => _toggle;
  set settoggle(bool tog) {
    _toggle = tog;
    
    notifyListeners();
  }


  var _themeMode = ThemeMode.light;
  get gettheme => _themeMode;
  setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
