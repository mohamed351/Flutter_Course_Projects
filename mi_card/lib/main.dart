import "package:flutter/material.dart";

void main() {
  runApp(MiCard());
}

class MiCard extends StatelessWidget {
  const MiCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage("images/profile.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Mohamed Beshri Amer",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Pacifico"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ".NET Developer",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SourceSansPro"),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Divider(
                  height: 2,
                  color: Colors.white,
                ),
                width: 200,
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("+20 1024181643")),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: ListTile(
                      leading: Icon(Icons.email),
                      title: Text("mohamed.beshri.amer@gmail.com")),
                ),
              )
            ]),
      ),
    );
  }
}
