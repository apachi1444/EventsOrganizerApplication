import 'package:flutter/material.dart';
import 'package:pfs/screens/userPages/parametersPages/editProfile/editProfileParts/buttonUpdate.dart';

import 'editProfileParts/allRowsOfFieldsProfessionalData.dart';
import 'editProfileParts/imageAboveTheContainer.dart';
import 'editProfileParts/wholeContainerOfUpdatingDataProfessional.dart';

class EditProfileProfessionalPage extends StatelessWidget {
  const EditProfileProfessionalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: const [
        ImageAboveTheContainer(),
        WholeContainerOfUpdatingDataProfessional(),
        AllRowsOfFieldsProfessionalData(),
        SizedBox(height: 15),
        ButtonUpdate(text: 'Update', logo: Icons.update),
      ])),
    );
  }
}
