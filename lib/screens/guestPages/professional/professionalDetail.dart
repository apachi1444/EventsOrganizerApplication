import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProfessionalDetailParts/descriptionBoxProfessionalDetail.dart';
import 'ProfessionalDetailParts/navbarItemProfessionalDetail.dart';
import 'ProfessionalDetailParts/textDescriptionProfessionalDetail.dart';

class ProfessionalDetail extends StatelessWidget {
  const ProfessionalDetail(
      {Key? key,
      required this.description,
      required this.price,
      required this.image, required this.dateTime, required this.title})
      : super(key: key);
  final String description;

  final String price;

  final String image;

  final String dateTime;

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children:  [
        // this container for the list of images that are on the top of the page
         NavbarItemProfessionalDetail(title : title),
        const SizedBox(height: 36),
        // This container for the details of the professional that we gonna contact
        //DesscriptionBoxProfessionalDetail(),
        TextDescriptionProfessionalDetailPage(
          price: price ,
          description: description,
          image: image,
          dateTime : dateTime
        ),
      ])),
    );
  }
}
