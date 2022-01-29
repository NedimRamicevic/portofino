import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (val) async {
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
            onChanged: (val) async {
              setState(() {
                password = val;
              });
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.purple),
            child: Text("Register"),
            onPressed: () async {
              print(email);
              print(password);
            },
          )
        ],
      )),
    );
  }
}
