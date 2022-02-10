import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portofino/models/user.dart';
import 'package:portofino/services/database.dart';
import 'package:portofino/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["1", "2", "3", "4", "5"];

  // Form Values

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DataBaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data!;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text("Update Your Settings"),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: textInputDecoration,
                    initialValue: userData.name,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    value: _currentSugars ?? userData.sugars,
                    decoration: textInputDecoration,
                    hint: const Text("Choose Sugar Amount"),
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                          value: sugar, child: Text("$sugar sugars"));
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _currentSugars = val.toString();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Slider(
                      value: _currentStrength?.toDouble() ??
                          userData.strength.toDouble(),
                      activeColor: Colors.brown[_currentStrength!],
                      inactiveColor: Colors.brown[_currentStrength!],
                      min: 100,
                      max: 900,
                      divisions: 8,
                      onChanged: (val) {
                        setState(() {
                          _currentStrength = val.round();
                        });
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print(_currentName);
                        print(_currentSugars);
                        print(_currentStrength);
                      },
                      child: Text("Update")),
                ],
              ),
            );
          } else {}
        });
  }
}
