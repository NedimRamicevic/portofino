import 'package:flutter/material.dart';
import 'package:portofino/screens/services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.setifSignIn}) : super(key: key);
  final Function setifSignIn;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 20)),
              onPressed: () {
                widget.setifSignIn();
              },
              child: const Text("Sign In"))
        ],
        elevation: 0,
        title: const Text("Register"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        color: Colors.amberAccent[400],
        child: Form(
            key: _registerKey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "E-mail"),
                  validator: (value) =>
                      value!.isEmpty ? "write an email" : null,
                  onChanged: (val) async {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (value) =>
                      value!.length < 6 ? "at least 6 characters" : null,
                  obscureText: true,
                  onChanged: (val) async {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  error,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  child: const Text("Register"),
                  onPressed: () async {
                    if (_registerKey.currentState!.validate()) {
                      dynamic result = await _auth
                          .createUserWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = "enter a valid email";
                        });
                      }
                    }
                  },
                )
              ],
            )),
      ),
    );
  }
}
