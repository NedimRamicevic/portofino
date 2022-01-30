import 'package:flutter/material.dart';
import 'package:portofino/screens/authentication/register.dart';
import 'package:portofino/screens/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool ifSignIn = true;
  void setifSignIn() {
    setState(() {
      ifSignIn = !ifSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ifSignIn) {
      return SignIn(setifSignIn: setifSignIn);
    } else {
      return Register(setifSignIn: setifSignIn);
    }
  }
}
