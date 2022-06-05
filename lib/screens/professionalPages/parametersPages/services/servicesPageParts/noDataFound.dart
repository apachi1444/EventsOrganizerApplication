import 'package:flutter/material.dart';

import '../../../../../extensions/constants.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(size.width * 0.05),
        height: size.height * 0.1,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  offset: const Offset(0, 4))
            ],
            color: const Color(ConstantColors.KGreyColor),
            borderRadius: BorderRadius.circular(35)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Icon(Icons.not_interested, color: Color(ConstantColors.KPinkColor)),
          Expanded(child: Center(child: Text('No Services ! Please add One')))
        ]));
  }
}
