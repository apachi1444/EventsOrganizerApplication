import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../extensions/constant_colors.dart';

class RowOfSpecificFieldOfProfessionalData extends StatefulWidget {
  final String inputText;
  final IconData icon;
  final String nameField;
  const RowOfSpecificFieldOfProfessionalData(
      {Key? key,
      required this.inputText,
      required this.icon,
      required this.nameField})
      : super(key: key);

  @override
  State<RowOfSpecificFieldOfProfessionalData> createState() =>
      _RowOfSpecificFieldOfProfessionalDataState();
}

class _RowOfSpecificFieldOfProfessionalDataState
    extends State<RowOfSpecificFieldOfProfessionalData> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Icon(
            widget.icon,
            color: const Color(ConstantColors.KPinkColor),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Text(widget.nameField,
              style: const TextStyle(color: Color(ConstantColors.KPinkColor))),
        ],
      ),
      Text(widget.inputText, style: TextStyle())
    ]);
  }
}
