import 'dart:math';

import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    home: DiceApp(),
  ));
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int _leftdiceNumber = 1;
  int _rightdiceNumber = 1;

  @override
  void initState() {
    setState(() {
      _leftdiceNumber = Random().nextInt(6) + 1;
      _rightdiceNumber = Random().nextInt(6) + 1;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Dice App")),
      body: Container(
          height: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    _leftdiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("images/dice$_leftdiceNumber.png"),
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    _rightdiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("images/dice$_rightdiceNumber.png"),
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
