import "package:flutter/material.dart";

void main(){
    runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      backgroundColor: Colors.teal,
      // appBar: AppBar(title: Text("Layout Changelle")),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.spaceBetween ,
         children: [
           Container(color: Colors.red, width: 100,),
           Container(child: Column(
             mainAxisAlignment:  MainAxisAlignment.center,
               children: [
             Container(color: Colors.yellow, width: 100, height: 100,),
             Container(color: Colors.green, width: 100, height: 100,)
           ]), ),
           Container(color: Colors.blue, width: 100,)
         ],
      ),
    ));
  }
}
