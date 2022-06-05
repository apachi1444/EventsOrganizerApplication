import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/constants.dart';
import '../../../../services/authService.dart';

class ButtonParameterProfilePageGuest extends StatefulWidget {
  final String text;
  final IconData logo;
  const ButtonParameterProfilePageGuest({
    Key? key,
    required this.text,
    required this.logo,
  }) : super(key: key);

  @override
  State<ButtonParameterProfilePageGuest> createState() =>
      _ButtonParameterProfilePageGuestState();
}

class _ButtonParameterProfilePageGuestState
    extends State<ButtonParameterProfilePageGuest> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.text == "Log Out") {
          AuthService().signOut();
          Navigator.pushNamedAndRemoveUntil(
              context, '/loginGuest', (r) => false);
        }
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.28,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: const Color(ConstantColors.KGreyColor),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                    spreadRadius: 3,
                    offset: const Offset(0, 1.2))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: Center(
                child: Column(children: [
                  Icon(widget.logo),
                  const SizedBox(height: 10),
                  Text(widget.text)
                ]),
              ),
            ),
          )),
    );
  }
}
