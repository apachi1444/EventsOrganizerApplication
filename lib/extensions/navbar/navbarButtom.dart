import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/authService.dart';
import '../constant_colors.dart';

class NavBarButtom extends StatefulWidget {
  const NavBarButtom({Key? key}) : super(key: key);

  @override
  State<NavBarButtom> createState() => _NavBarButtomState();
}

class _NavBarButtomState extends State<NavBarButtom> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'LogOut',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color(ConstantColors.KPinkColor),
      onTap: (value) {
        // if we type on the log out button which has the index number two it will lead us to the login page
        if (selectedIndex == 2) {
          AuthService().SignOut();
          return;
        }
        setState(() {
          selectedIndex = value;
        });
      },
    );
  }
}
