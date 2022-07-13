import 'package:flutter/material.dart';

class Task extends ChangeNotifier {
  String title;
  bool finished = false;
  Task({this.title = "", this.finished = false});

  void toggleDone() {
    finished = !finished;
  }
}
