// this page will be user for doing the drop down forms

import "package:flutter/material.dart";

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  String _firstName = '';
  String _lastName = "yessine";
  double _age = 0;

  String _selectedValue = "5";
  List<String> listOfValue = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Text("Update Your Person Settings",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.red,
                )),
            const SizedBox(height: 20),
            TextFormField(
                validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) =>
                    setState(() {
                      _firstName = val;
                    })),
            const SizedBox(height: 20),
            // DropdownButtonFormField(
            //   items: sugars.map((sugar) {
            //     return DropdownMenuItem(value: sugar, child: Text(sugar));
            //   }).toList(),
            //   onChanged: (val) {
            //     setState(
            //       () {
            //         _lastName = val as String;
            //       },
            //     );
            //   },
            //   value: _lastName,
            // ),

            DropdownButtonFormField(
              value: _selectedValue,
              hint: Text(
                'choose one',
              ),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as String;
                });
              },
              onSaved: (value) {
                setState(() {
                  _selectedValue = value as String;
                });
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "can't empty";
                } else {
                  return null;
                }
              },
              items: listOfValue
                  .map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),
            Slider(
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.red,
              min: 0,
              max: 900,
              divisions: 8,
              value: _age,
              onChanged: (double value) {
                setState(() {
                  _age = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                print(_firstName);
                print(_lastName);
                print(_age);
              },
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ));
  }
}
