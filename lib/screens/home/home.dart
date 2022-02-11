import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portofino/screens/home/brew_list.dart';
import 'package:portofino/screens/home/settings_form.dart';
import 'package:portofino/services/auth.dart';
import 'package:portofino/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  AuthService get _auth => AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: const SettingsForm(),
            );
          });
    }

    return StreamProvider.value(
      value: DataBaseService(uid: user.uid).brews,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          elevation: 0,
          title: const Text(
            "Welcome Home",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  onPrimary: Colors.black,
                  elevation: 0,
                ),
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: const Icon(Icons.person),
                label: const Text("logout")),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  onPrimary: Colors.black,
                  elevation: 0,
                ),
                onPressed: () {
                  _showSettingsPanel();
                },
                icon: const Icon(
                  Icons.settings,
                ),
                label: const Text("Settings"))
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/coffee_bg.png"),
                    fit: BoxFit.cover)),
            child: const BrewList()),
      ),
    );
  }
}
