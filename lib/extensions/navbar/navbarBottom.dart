import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class NavBarBottom extends StatefulWidget {
  final bool isGuest;
  final int selectedIndex;

  const NavBarBottom(
      {Key? key, required this.isGuest, required this.selectedIndex})
      : super(key: key);

  @override
  State<NavBarBottom> createState() => _NavBarBottomState();
}

class _NavBarBottomState extends State<NavBarBottom> {
  int selectedIndex = 2;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  int index = 0;

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
      child: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(seconds: 1),
        height: 60,
        backgroundColor: const Color(ConstantColors.KGreyColor),
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: (index) => setState(() {
          selectedIndex = index;
        }),
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.house_siding_rounded),
            selectedIcon: Icon(Icons.logout_outlined),
          ),
          NavigationDestination(
              label: 'Profile', icon: Icon(Icons.pause_rounded)),
          NavigationDestination(
              label: 'LogOut', icon: Icon(Icons.logout_outlined)),
        ],
      ),
    );
    // : BottomNavigationBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.business),
    //         label: 'Profile',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.school),
    //         label: 'LogOut',
    //       ),
    //     ],
    //     currentIndex: selectedIndex,
    //     selectedItemColor: const Color(ConstantColors.KPinkColor),
    //     onTap: (value) {
    //       // if we type on the log out button which has the index number two it will lead us to the login page
    //       if (selectedIndex == 2) {
    //         AuthService().SignOut();
    //         return;
    //       }
    //       setState(() {
    //         selectedIndex = value;
    //       });
    //     },
    //   );
  }
}
