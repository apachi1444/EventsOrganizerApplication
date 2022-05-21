import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navbarItem.dart';

class NavBarButtom extends StatelessWidget {
  const NavBarButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 81,
        color: Colors.white,
        child: Row(
          children: [
            BottomNavItem(
                svgImg: 'assets/welcome.svg',
                text: 'text',
                press: () {
                  print('hardhat');
                },
                is_active: false),
            BottomNavItem(
                svgImg: 'assets/welcome.svg',
                text: 'text',
                press: () {
                  print("hahahaha");
                },
                is_active: true),
            BottomNavItem(
                svgImg: 'assets/welcome.svg',
                text: 'text',
                press: () {
                  print("hahahaha");
                },
                is_active: false),
          ],
        ));
  }
}
