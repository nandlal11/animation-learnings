import 'package:flutter/material.dart';

class HeroAnimProvider extends ChangeNotifier {
  bool _isFav = false;

  bool get isFav => _isFav;

  set setIsFav(bool value) {
    _isFav = value;
    notifyListeners();
  }
}
