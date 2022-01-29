import 'package:flutter/material.dart';
import 'package:portofino/screens/authentication/register.dart';
import 'package:portofino/screens/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        title: const Text("Sign In"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: EdgeInsets.symmetric(horizontal: 20)),
                    onPressed: () async {
                      print(email);
                      print(password);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: EdgeInsets.symmetric(horizontal: 20)),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            )
          ],
        )),
      ),
    );
  }
}
