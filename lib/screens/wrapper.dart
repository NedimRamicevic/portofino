import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portofino/screens/authentication/authenticate.dart';
import 'package:portofino/screens/home/home.dart';
import 'package:portofino/services/database.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return Home or Authenticate widget
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
