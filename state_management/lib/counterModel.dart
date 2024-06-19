import 'package:flutter/cupertino.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  //counter is used to access the data from the UI
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners(); //similar to the setState() or update() with this when the value of the _counter changes it is notified.
  }

  void decrementCounter() {
    _counter--;
    notifyListeners(); //similar to the setState() or update() with this when the value of the _counter changes it is notified.
  }
}
