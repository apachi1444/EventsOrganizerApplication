import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../extensions/constant_colors.dart';
import '../../../../../services/authService.dart';

class ButtonUpdate extends StatefulWidget {
  final String text;
  final IconData logo;
  const ButtonUpdate({
    Key? key,
    required this.text,
    required this.logo,
  }) : super(key: key);

  @override
  State<ButtonUpdate> createState() => _ButtonUpdate();
}

class _ButtonUpdate extends State<ButtonUpdate> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.text == "Log Out") {
          AuthService().SignOut();
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
