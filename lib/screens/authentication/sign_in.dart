import 'package:flutter/material.dart';
import 'package:portofino/screens/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        title: Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print("Error");
              } else {
                print("Signed In as $result");
              }
            },
            child: Text("Sign In Anon")),
      ),
    );
  }
}
