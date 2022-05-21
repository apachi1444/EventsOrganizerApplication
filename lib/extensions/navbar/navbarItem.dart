import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant_colors.dart';

class BottomNavItem extends StatelessWidget {
  final String svgImg;
  final String text;
  final Function press;
  // ignore: non_constant_identifier_names
  final bool is_active;

  const BottomNavItem(
      {Key? key,
      required this.svgImg,
      required this.text,
      required this.press,
      required this.is_active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 40,
              width: 52,
              decoration: const BoxDecoration(
                color: Color(ConstantColors.KPinkColor),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(svgImg,
                  color: is_active
                      ? Color(ConstantColors.activeColor)
                      : Color(ConstantColors.inactiveColor))),
          Text(text,
              style: TextStyle(
                  color: is_active
                      ? Color(ConstantColors.activeColor)
                      : Color(ConstantColors.inactiveColor)))
        ],
      ),
    );
  }
}
