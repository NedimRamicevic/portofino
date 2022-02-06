import 'package:flutter/material.dart';
import 'package:portofino/screens/authentication/register.dart';
import 'package:portofino/screens/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.setifSignIn}) : super(key: key);
  final Function setifSignIn;
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();


  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 20)),
              onPressed: () {
                widget.setifSignIn();
              },
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              )),
        ],
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        title: const Text("Sign In"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _registerKey,
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 20)),
                onPressed: () async {
                  if()
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              width: 20,
            )
          ],
        )),
      ),
    );
  }
}
