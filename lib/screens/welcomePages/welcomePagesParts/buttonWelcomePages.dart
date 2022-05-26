import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/authPages/log_in_as_a_guest_page.dart';

import '../../../logic/auth_page.dart';

class ButtonWelcomePages extends StatefulWidget {
  final String textInsideButton;
  const ButtonWelcomePages({Key? key, required this.textInsideButton})
      : super(key: key);

  @override
  State<ButtonWelcomePages> createState() => _ButtonWelcomePagesState();
}

class _ButtonWelcomePagesState extends State<ButtonWelcomePages> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color(0XFFF8F4F4),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ]),
          child: GestureDetector(
            onTap: () {
              if (widget.textInsideButton == 'Start The Adventure') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LogInAsAGuestPage();
                }));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AuthPage();
                }));
              }
            },
            child: Center(
              child: Text(widget.textInsideButton,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ));
  }
}
