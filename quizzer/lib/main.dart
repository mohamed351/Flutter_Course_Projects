import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(children: [
        Expanded(
          child: Center(
            child: Text(
              "The Question",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text("True"),
            onPressed: () {},
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
          ),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            child: Text("False"),
            onPressed: () {},
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          ),
        ),
        Container(
          child: Row(children: [
            Icon(
              Icons.done,
              color: Colors.green,
            ),
            Icon(
              Icons.close,
              color: Colors.red,
            )
          ]),
        )
      ]),
    );
  }
}
