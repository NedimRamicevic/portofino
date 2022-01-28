import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              onPressed: null, icon: Icon(Icons.person), label: Text("logout"))
        ],
      ),
    );
  }
}
