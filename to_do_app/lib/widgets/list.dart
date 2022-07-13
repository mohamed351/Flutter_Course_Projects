import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/task_provider.dart';

class AppList extends StatefulWidget {
  const AppList({Key? key}) : super(key: key);

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Consumer<TaskData>(
          builder: (context, value, child) {
            return ListView(children: [
              ...value.tasks.map((e) => ListTile(
                    onLongPress: () {
                      Provider.of<TaskData>(context, listen: false)
                          .removeTask(e);
                    },
                    title: Text(e.title),
                    trailing: Checkbox(
                      value: e.finished,
                      onChanged: (_) =>
                          Provider.of<TaskData>(context, listen: false)
                              .UpdateTask(e),
                    ),
                  ))
            ]);
          },
        ));
  }
}
