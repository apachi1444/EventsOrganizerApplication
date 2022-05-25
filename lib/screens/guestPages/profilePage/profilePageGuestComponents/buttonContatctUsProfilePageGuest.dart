import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/constant_colors.dart';

class ButtonContactUsProfilePageGuest extends StatelessWidget {
  const ButtonContactUsProfilePageGuest({Key? key}) : super(key: key);

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
        Icons.warning_amber,
        size: 24.0,
      ),
      label: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Contact Us'),
      ), // <-- Text
    );
    ;
  }
}
