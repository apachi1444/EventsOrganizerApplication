import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../extensions/constant_colors.dart';

class OneButtonServicePage extends StatefulWidget {
  final bool isClicked;
  final String text;

  const OneButtonServicePage(
      {Key? key, required this.text, required this.isClicked})
      : super(key: key);

  @override
  State<OneButtonServicePage> createState() => _OneButtonServicePageState();
}

class _OneButtonServicePageState extends State<OneButtonServicePage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          print('this is the button in the services of the professional');
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey,
                    spreadRadius: 2,
                    offset: Offset(0, 2))
              ],
              color: widget.isClicked
                  ? const Color(ConstantColors.KPinkColor)
                  : const Color(ConstantColors.KGreyColor),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: Text(widget.text,
                    style: TextStyle(
                        color: widget.isClicked ? Colors.white : Colors.black)),
              ),
            )),
      ),
    );
  }
}
