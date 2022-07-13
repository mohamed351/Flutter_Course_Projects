import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/task_provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          child: Icon(Icons.list),
          backgroundColor: Colors.white,
          radius: 25,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Todoey",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 30),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Tasks  ${Provider.of<TaskData>(context).tasks.length.toString()}",
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
    );
  }
}
