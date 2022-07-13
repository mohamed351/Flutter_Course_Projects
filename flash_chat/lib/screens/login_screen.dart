import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class LoginScreen extends StatefulWidget {
  static const router = "login-screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  late FirebaseAuth _firebaseAuth;
  bool isloading = false;

  @override
  void initState() {
    _firebaseAuth = FirebaseAuth.instance;
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
                    this.email = value;
                  },
                  decoration:
                      kInputDecoration.copyWith(hintText: "Enter your email")),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  style: kTextStyle,
                  obscureText: true,
                  onChanged: (value) {
                    this.password = value;
                  },
                  decoration: kInputDecoration.copyWith(
                      hintText: "Please Enter your Password")),
              const SizedBox(
                height: 24.0,
              ),
              CustomButton(
                  text: "text",
                  callback: () async {
                    try {
                      setState(() {
                        isloading = true;
                      });
                      final loginUser =
                          await _firebaseAuth.signInWithEmailAndPassword(
                              email: this.email, password: this.password);
                      setState(() {
                        isloading = false;
                      });
                      Navigator.pushNamed(context, ChatScreen.router);
                    } catch (e) {
                      setState(() {
                        isloading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(milliseconds: 5000),
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
