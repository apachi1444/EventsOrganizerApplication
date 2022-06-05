import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/extensions/constants.dart';

import 'addServicePopUpModal.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          _showTheAddServiceBottomModal(context);
        },
        child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(ConstantColors.KPinkColor),
            ),
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(Icons.add, color: Colors.white),
            )),
      ),
    );
  }
}

void _showTheAddServiceBottomModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return const AddServicePopUpModal();
      });
}
