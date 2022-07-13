import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/widgets/header.dart';
import 'package:to_do_app/widgets/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        home: Scaffold(
            floatingActionButton: Builder(builder: (context) {
              return FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  showCurrentModal(context);
                },
              );
            }),
            backgroundColor: Colors.blue,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Header(),
                  ),
                  Expanded(child: AppList())
                ],
              ),
            )),
      ),
    );
  }

  void showCurrentModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Task",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _controller,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isEmpty) {
                      return;
                    }
                    Provider.of<TaskData>(context, listen: false).AddTask(
                        Task(title: _controller.value.text, finished: false));
                    _controller.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Add")),
            )
          ]),
        );
      },
    );
  }
}
