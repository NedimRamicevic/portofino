import 'package:flutter/material.dart';
import 'package:portofino/screens/services/auth.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  AuthService get _auth => AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text("Welcome Home"),
        actions: [
          ElevatedButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("logout"))
        ],
      ),
    );
  }
}
