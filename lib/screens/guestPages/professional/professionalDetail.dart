import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProfessionalDetailParts/descriptionBoxProfessionalDetail.dart';
import 'ProfessionalDetailParts/navbarItemProfessionalDetail.dart';
import 'ProfessionalDetailParts/textDescriptionProfessionalDetail.dart';

class ProfessionalDetail extends StatelessWidget {
  const ProfessionalDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: const [
        // this container for the list of images that are on the top of the page
            NavbarItemProfessionalDetail(),
            SizedBox(height: 36),
        // This container for the details of the professional that we gonna contact
            DesscriptionBoxProfessionalDetail(),
            TextDescriptionProfessionalDetailPage(),
      ])),
    );
  }
}
