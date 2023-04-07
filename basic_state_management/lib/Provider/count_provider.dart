import 'package:flutter/material.dart';

class CountState extends ChangeNotifier {
  int count = 0;
  String title = "Provider";
  bool isWhite = true;
  void increament() {
    this.count++;
    notifyListeners();
  }

  void decrement() {
    this.count--;
    notifyListeners();
  }

  void toggleColor() {
    this.isWhite = !isWhite;
    notifyListeners();
  }
}
