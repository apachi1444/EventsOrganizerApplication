import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../extensions/constants.dart';
import '../../common/dialogShowingListEventsAvailable.dart';

class ExpandedButtonProfessionalDetail extends StatelessWidget {
  const ExpandedButtonProfessionalDetail(
      {Key? key,
      required this.price,
      required this.dateTime,
      required this.image,
      required this.title,
      required this.imageCategory,
      required this.firstNameProfessional,
      required this.lastNameProfessional,
      required this.description})
      : super(key: key);

  final String price;
  final String dateTime;
  final String image;
  final String title;
  final String imageCategory;
  final String firstNameProfessional;
  final String lastNameProfessional;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          primary: const Color(ConstantColors.KPinkColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DialogShowingListEventsAvailable(
              professionalFirstName: firstNameProfessional,
              description: description,
              price: price,
              title: title,
              imageCategory: imageCategory,
              professionalLastName: lastNameProfessional,
            );
          },
        );
      },
      icon: const Icon(
        // <-- Icon
        Icons.add_box_outlined,
        size: 24.0,
      ),
      label: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Add To List'),
      ), // <-- Text
    );
  }
}
