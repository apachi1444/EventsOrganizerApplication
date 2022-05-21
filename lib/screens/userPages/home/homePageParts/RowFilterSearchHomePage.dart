import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/constant_colors.dart';

class RowFilterSearchHomePage extends StatelessWidget {
  const RowFilterSearchHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: TextField(
              autofocus: false,
              style: const TextStyle(fontSize: 15.0, color: Color(0XFFF8F4F4)),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search By Category',
                filled: true,
                fillColor: const Color(0XFFF8F4F4),
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.only(
                    left: 14.0, bottom: 0.0, top: 14.0, right: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
        ),
        Ink(
          decoration: const ShapeDecoration(
            color: Color(ConstantColors.KPinkColor),
            shape: CircleBorder(),
          ),
          child: IconButton(
            onPressed: () {
              // You enter here what you want the button to do once the user interacts with it
            },
            icon: const Icon(
              Icons.filter,
              color: Colors.white,
            ),
            iconSize: 20.0,
          ),
        )
      ],
    );
  }
}
