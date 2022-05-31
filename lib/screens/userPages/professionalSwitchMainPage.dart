import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/sharedScreens/search/searchPage.dart';
import 'package:pfs/screens/userPages/home_page_test_animation.dart';
import 'package:pfs/screens/userPages/parametersPages/editProfile/edit_profile_page.dart';
import 'package:pfs/screens/userPages/parametersPages/services/servicesPage.dart';
import 'package:pfs/screens/userPages/parametersPages/settings/settings_page.dart';

import '../../extensions/constant_colors.dart';

class ProfessionalSwitchMainPage extends StatefulWidget {
  const ProfessionalSwitchMainPage({Key? key}) : super(key: key);

  @override
  State<ProfessionalSwitchMainPage> createState() =>
      _ProfessionalSwitchMainPageState();
}

class _ProfessionalSwitchMainPageState
    extends State<ProfessionalSwitchMainPage> {
  int _index = 4;

  void _navigateBottomBar(int index) {
    setState(() {
      _index = index;
    });
  }

  final items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.list_outlined), label: 'Services'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];
  final screens = [
    const HomePage(),
    const ServicesPage(),
    const SearchPage(),
    const Setting(),
    const EditProfileProfessionalPage(),
  ];
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              indicatorColor: const Color(ConstantColors.KPinkColor)),
          child: BottomNavigationBar(
            backgroundColor:
                const Color(ConstantColors.KGreyColor).withOpacity(0.9),
            fixedColor: const Color(ConstantColors.KPinkColor),
            onTap: _navigateBottomBar,
            currentIndex: _index,
            type: BottomNavigationBarType.fixed,
            items: items,
          )),
      body: screens[_index],
    );
  }
}
