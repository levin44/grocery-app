import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 5;

  int get counter => _counter;

  void increaseCounter() {
    _counter++;
    notifyListeners();
  }

  void decreaseCounter() {
    _counter--;
    notifyListeners();
  }
}
