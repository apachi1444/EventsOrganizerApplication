// this page will be user for doing the drop down forms

import 'package:flutter/material.dart';
import 'package:pfs/services/professionalDbService.dart';

import '../../../../../extensions/constants.dart';
import '../../../../../extensions/validators.dart';
import '../../../../authPages/inputTextWidget.dart';

class UpdateProfessionalBottomModel extends StatelessWidget {
  UpdateProfessionalBottomModel({Key? key, required this.uid})
      : super(key: key);
  final String? uid;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // this part is for the controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _localisationController = TextEditingController();

  // this is the end of the definition of the controllers

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
                  validate: FirstNameValidator.validate,
                  icon: Icons.person,
                  controllerUsedInInput: _firstNameController,
                  inputHintText: 'update Your Name',
                  isPassword: false),
              const SizedBox(height: 15),
              InputTextWidget(
                  validate: LastNameValidator.validate,
                  icon: Icons.person,
                  controllerUsedInInput: _lastNameController,
                  inputHintText: 'update Your Last Name',
                  isPassword: false),
              const SizedBox(height: 20),
              InputTextWidget(
                validate: LocalisationValidator.validate,
                  icon: Icons.map_rounded,
                  controllerUsedInInput: _localisationController,
                  inputHintText: 'update Your Localisation',
                  isPassword: false),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  _updateProfessionalData();
                  Navigator.pop(context);
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

  void _updateProfessionalData() {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String localisation = _localisationController.text.trim();

    ProfessionalDatabaseService(uid: uid)
        .changeProfessionalData(firstName, lastName, localisation);
  }
}
