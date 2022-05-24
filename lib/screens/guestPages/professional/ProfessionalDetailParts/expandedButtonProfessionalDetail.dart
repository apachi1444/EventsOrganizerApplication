import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../extensions/constant_colors.dart';

class ExpandedButtonProfessionalDetail extends StatelessWidget {
  const ExpandedButtonProfessionalDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          primary: const Color(ConstantColors.KPinkColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      onPressed: () {},
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
