import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portofino/services/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  AuthService get _auth => AuthService();

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<QuerySnapshot>(context);
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: const Text("Welcome Home"),
        actions: [
          ElevatedButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.person),
              label: const Text("logout"))
        ],
      ),
    );
  }
}
