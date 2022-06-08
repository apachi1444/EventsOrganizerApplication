import 'package:flutter/material.dart';
import 'package:pfs/screens/professionalPages/parametersPages/editProfile/editProfileParts/rowOfSpecificFieldOfProfessionalData.dart';

import '../../../../../sharedPreferences/ProfessionalPreferences.dart';
import 'fieldsOfProfessionals.dart';

class AllRowsOfFieldsProfessionalData extends StatelessWidget {
  AllRowsOfFieldsProfessionalData({Key? key}) : super(key: key);

  final allInputs = [
    ProfessionalPreferences.getFirstName().toString(),
    ProfessionalPreferences.getLastName().toString(),
    ProfessionalPreferences.getEmail().toString(),
    ProfessionalPreferences.getLocalisation().toString(),
    'Gender',
  ];
  @override
  Widget build(BuildContext context) {
    final allFields = allFieldsProfessional;
    print(ProfessionalPreferences.getLastName().toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 6),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Personal Data',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ],
          ),
          Divider(
              height: MediaQuery.of(context).size.height * 0.04,
              color: Colors.black),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 1),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                    height: MediaQuery.of(context).size.height * 0.04,
                    color: Colors.black),
                physics:
                    const NeverScrollableScrollPhysics(), // <-- this will disable scroll
                shrinkWrap: true,
                itemCount: allFields.length,
                itemBuilder: (context, index) {
                  return RowOfSpecificFieldOfProfessionalData(
                      nameField: allFields[index],
                      inputText: allInputs[index],
                      icon: Icons.person);
                }),
          )
        ],
      ),
    );
  }
}
