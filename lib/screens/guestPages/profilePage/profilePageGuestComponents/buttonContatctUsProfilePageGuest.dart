import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/professionalPages/parametersPages/contactUs/contactUs.dart';

import '../../../../extensions/constants.dart';

class ButtonContactUsProfilePageGuest extends StatelessWidget {
  const ButtonContactUsProfilePageGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          primary: const Color(ConstantColors.KPinkColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const ContactUs(),
            ));
      },
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
