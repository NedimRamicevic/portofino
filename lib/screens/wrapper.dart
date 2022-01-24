import 'package:flutter/material.dart';
import 'package:portofino/screens/authentication/authenticate.dart';
import 'package:portofino/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Home or Authenticate widget
    return const Authenticate();
  }
}
