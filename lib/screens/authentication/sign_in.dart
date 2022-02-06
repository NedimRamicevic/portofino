import 'package:flutter/material.dart';
import 'package:portofino/screens/services/auth.dart';
import 'package:portofino/shared/constants.dart';

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
                  padding: const EdgeInsets.symmetric(horizontal: 20)),
              onPressed: () {
                widget.setifSignIn();
              },
              child: const Text(
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
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    hintText: "E-mail",
                  ),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    hintText: "Password",
                  ),
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(error),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.symmetric(horizontal: 20)),
                    onPressed: () async {
                      if (_registerKey.currentState!.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            error = "wrong email or password";
                          });
                        }
                      }
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  width: 20,
                )
              ],
            )),
      ),
    );
  }
}
