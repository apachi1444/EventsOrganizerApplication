import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color(0XFFFF006B),
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
            onTap: () async {},
            child: const Center(
              child: Text('Update',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
            ),
          ),
        ));
  }
}
