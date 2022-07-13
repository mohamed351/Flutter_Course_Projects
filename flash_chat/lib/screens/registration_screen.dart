import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/widgets/button.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const router = "register-screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String email;
  late String password;
  late FirebaseAuth _auth;
  bool isloading = false;

  @override
  void initState() {
    _auth = FirebaseAuth.instance;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  style: kTextStyle,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kInputDecoration.copyWith(
                      hintText: "Please enter your email")),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  style: kTextStyle,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kInputDecoration.copyWith(
                      hintText: "Please enter your Password")),
              const SizedBox(
                height: 24.0,
              ),
              CustomButton(
                  text: "Register",
                  callback: () async {
                    try {
                      setState(() {
                        isloading = true;
                      });
                      if (this.email.isEmpty || this.password.isEmpty) {
                        return;
                      }
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: this.email, password: this.password);
                      setState(() {
                        isloading = false;
                      });
                      Navigator.pushNamed(context, ChatScreen.router);
                    } catch (e) {
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
