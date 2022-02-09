import 'package:flutter/material.dart';
import 'package:portofino/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["1", "2", "3", "4", "5"];

  // Form Values

  String _currentName = "";
  String _currentSugars = "";
  int _currentStrength = 100;
  @override
  Widget build(BuildContext context) {
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
            validator: (val) => val!.isEmpty ? "Please Enter a Name" : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownButtonFormField(
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
              value: _currentStrength.toDouble(),
              activeColor: Colors.brown[_currentStrength],
              inactiveColor: Colors.brown[_currentStrength],
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
  }
}
