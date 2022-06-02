import 'package:flutter/material.dart';
import 'package:pfs/screens/professionalPages/parametersPages/editProfile/editProfileParts/buttonUpdate.dart';

import 'editProfileParts/allRowsOfFieldsProfessionalData.dart';
import 'editProfileParts/imageAboveTheContainer.dart';
import 'editProfileParts/wholeContainerOfUpdatingDataProfessional.dart';

class EditProfileProfessionalPage extends StatelessWidget {
  const EditProfileProfessionalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          const ImageAboveTheContainer(),
          const WholeContainerOfUpdatingDataProfessional(),
          AllRowsOfFieldsProfessionalData(),
          const SizedBox(height: 15),
          const ButtonUpdate(text: 'Update', logo: Icons.update),
        ]),
      )),
    );
  }
}
