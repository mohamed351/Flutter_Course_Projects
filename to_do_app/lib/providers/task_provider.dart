import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(title: "testing", finished: false),
    Task(title: "testing2", finished: false),
    Task(title: "testing3", finished: true)
  ];

  void AddTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  void UpdateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
