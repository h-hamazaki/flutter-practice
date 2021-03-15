import 'package:flutter/material.dart';

class ProviderTestChangeNotifier with ChangeNotifier {
  int _counter = 0;
  get counter => _counter;
  set counter(int val) {
    _counter = _counter + val;
    notifyListeners();
    debugPrint("stateless counter: $_counter");
  }

  // void incrementCounter() {
  //   _counter++;
  //   debugPrint("stateless counter: $_counter");
  // }
}
