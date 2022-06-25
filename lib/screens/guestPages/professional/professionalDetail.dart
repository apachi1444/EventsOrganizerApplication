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
    print("this is the image");
    print(image);
    return SafeArea(
      child: Scaffold(
          body: Column(children:  [
        // this container for the list of images that are on the top of the page
         NavbarItemProfessionalDetail(image : image ,title : title),
        const SizedBox(height: 36),
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
