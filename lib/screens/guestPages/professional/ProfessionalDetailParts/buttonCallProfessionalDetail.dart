import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../extensions/constant_colors.dart';

class ButtonCallProfessionalDetail extends StatelessWidget {
  const ButtonCallProfessionalDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Color(ConstantColors.KPinkColor),
        shape: CircleBorder(),
      ),
      child: IconButton(
        onPressed: () {
          // You enter here what you want the button to do once the user interacts with it
        },
        icon: const Icon(
          Icons.phone,
          color: Colors.white,
        ),
        iconSize: 20.0,
      ),
    );
  }
}
