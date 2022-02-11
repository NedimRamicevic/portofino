import 'package:flutter/material.dart';
import 'package:portofino/models/brew.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({Key? key, required this.brew}) : super(key: key);
  final Brew brew;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          tileColor: Colors.lime,
          leading: CircleAvatar(
            backgroundImage: const AssetImage("assets/coffee_icon.png"),
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text("Takes ${brew.sugar} sugar(s)"),
        ),
      ),
    );
  }
}
