import 'package:flutter/material.dart';

class TweenAnimProvider extends ChangeNotifier {
  double opacity = 1;

  setOpacity(double value) {
    opacity = value;
    notifyListeners();
  }
}
