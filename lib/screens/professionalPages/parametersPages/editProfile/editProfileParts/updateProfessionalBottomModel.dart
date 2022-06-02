// this page will be user for doing the drop down forms

import 'package:flutter/material.dart';
import 'package:pfs/services/professionalDbService.dart';

import '../../../../../extensions/constant_colors.dart';
import '../../../../authPages/inputTextWidget.dart';

class UpdateProfessionalBottomModel extends StatefulWidget {
  const UpdateProfessionalBottomModel({Key? key}) : super(key: key);

  @override
  State<UpdateProfessionalBottomModel> createState() =>
      _UpdateProfessionalBottomModelState();
}

class _UpdateProfessionalBottomModelState
    extends State<UpdateProfessionalBottomModel> {
  final _formKey = GlobalKey<FormState>();

  // this part is for the controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _localisationController = TextEditingController();
  final _ageController = TextEditingController();
  // this is the end of the definition of the controllers

  String _selectedValue = '5';
  List<String> listOfValue = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text('Update Your Profile Information',
                    style: TextStyle(
                      fontSize: 19,
                      color: Color(ConstantColors.KPinkColor),
                    )),
              ),
              const SizedBox(height: 20),

              InputTextWidget(
                  icon: Icons.person,
                  controllerUsedInInput: _firstNameController,
                  inputHintText: 'update Your Name',
                  isPassword: false),

              const SizedBox(height: 15),

              InputTextWidget(
                  icon: Icons.person,
                  controllerUsedInInput: _lastNameController,
                  inputHintText: 'update Your Last Name',
                  isPassword: false),

              const SizedBox(height: 20),
              InputTextWidget(
                  icon: Icons.map_rounded,
                  controllerUsedInInput: _localisationController,
                  inputHintText: 'update Your Localisation',
                  isPassword: false),

              const SizedBox(height: 20),
              InputTextWidget(
                  icon: Icons.confirmation_number_sharp,
                  controllerUsedInInput: _ageController,
                  inputHintText: 'update Your Age',
                  isPassword: false),

              DropdownButtonFormField(
                value: _selectedValue,
                hint: const Text(
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
                items: listOfValue.map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              // Slider(
              //   activeColor: Colors.deepPurple,
              //   inactiveColor: Colors.red,
              //   min: 0,
              //   max: 900,
              //   divisions: 8,
              //   value: _age,
              //   onChanged: (double value) {
              //     setState(() {
              //       _age = value;
              //     });
              //   },
              // ),
              ElevatedButton(
                onPressed: () async {
                  String firstName = _firstNameController.text.trim();
                  String lastName = _lastNameController.text.trim();
                  String localisation = _localisationController.text.trim();
                  String age = _ageController.text.trim();
                  ProfessionalDatabaseService(uid: '').changeProfessionalData(
                      firstName, lastName, age, localisation);
                },
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
