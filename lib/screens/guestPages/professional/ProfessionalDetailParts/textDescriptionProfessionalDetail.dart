import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/professional/ProfessionalDetailParts/buttonCallProfessionalDetail.dart';
import 'package:pfs/screens/guestPages/professional/ProfessionalDetailParts/expandedButtonProfessionalDetail.dart';

import '../../../../../extensions/constant_colors.dart';

class TextDescriptionProfessionalDetailPage extends StatelessWidget {
  const TextDescriptionProfessionalDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Description',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 15),
          const Text(
              'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum last_name SingleTickerProviderStateMixin _lastNameController last_name last_namev last_namev hqhhqhqhdsfqskdfhkjsqdfhkjsqdhfkjsqdhfkj sjkdqfhqskjd fhjksqdhfjksldhf',
              style: TextStyle(
                  fontWeight: FontWeight.w100, color: Colors.blueGrey)),

          const SizedBox(height: 20),
          // this is for the price of the professionalDetail

          Row(
            children: const [
              Icon(Icons.monetization_on,
                  color: Color(ConstantColors.KPinkColor), size: 25),
              SizedBox(width: 10),
              Text('200 £',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),

          const SizedBox(height: 20),

          // this is the for the line of the add to list and the call button

          Row(
            children: const [
              Expanded(
                child: ExpandedButtonProfessionalDetail(),
              ),
              SizedBox(width: 15),
              ButtonCallProfessionalDetail(),
              // Ink
            ],
          )
        ],
      ),
    );
  }
}
