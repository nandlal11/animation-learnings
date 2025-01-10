import 'package:flutter/material.dart';

class TweenAnimProvider extends ChangeNotifier {
  double _opacity = 1;

  double get opacity => _opacity;

  set setOpacity(double value) {
    _opacity = value;
    notifyListeners();
  }
}
