import 'package:flutter/material.dart';

import 'ProfessionalDetailParts/descriptionBoxProfessionalDetail.dart';
import 'ProfessionalDetailParts/navbarItemProfessionalDetail.dart';
import 'ProfessionalDetailParts/textDescriptionProfessionalDetail.dart';

class ProfessionalDetail extends StatelessWidget {
  const ProfessionalDetail(
      {Key? key,
      required this.description,
      required this.price,
      required this.image,
      required this.dateTime,
      required this.title,
      required this.firstNameProfessional,
      required this.lastNameProfessional, required this.imageCategory})
      : super(key: key);
  final String description;

  final String price;

  final String image;

  final String dateTime;

  final String title;

  final String firstNameProfessional;

  final String lastNameProfessional;

  final String imageCategory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        // this container for the list of images that are on the top of the page
        NavbarItemProfessionalDetail(
          image: image,
          title: title,
          price: price,
          description: description,
          lastNameProfessional: lastNameProfessional,
          imageCategory: imageCategory,
          firstNameProfessional: firstNameProfessional,
        ),
        const SizedBox(height: 36),
        TextDescriptionProfessionalDetailPage(
          image: image,
          title: title,
          price: price,
          description: description,
          lastNameProfessional: lastNameProfessional,
          imageCategory: imageCategory,
          firstNameProfessional: firstNameProfessional,
          dateTime: dateTime,
        ),
      ])),
    );
  }
}
