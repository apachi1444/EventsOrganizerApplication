import 'package:flutter/material.dart';
import 'package:pfs/screens/userPages/parametersPages/editProfile/editProfileParts/buttonUpdate.dart';

class EditProfileProfessionalPage extends StatelessWidget {
  const EditProfileProfessionalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: const [
        ButtonUpdate(text: 'Update', logo: Icons.update),
      ])),
    );
  }
}
