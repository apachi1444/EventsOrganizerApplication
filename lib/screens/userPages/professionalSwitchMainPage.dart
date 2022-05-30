import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/sharedScreens/search/searchPage.dart';
import 'package:pfs/screens/userPages/home_page_test_animation.dart';
import 'package:pfs/screens/userPages/parametersPages/services/servicesPage.dart';
import 'package:pfs/screens/userPages/parametersPages/settings/settings_page.dart';
import 'package:pfs/screens/userPages/profile/profilePageProfTest.dart';

import '../../extensions/constant_colors.dart';

class ProfessionalSwitchMainPage extends StatefulWidget {
  const ProfessionalSwitchMainPage({Key? key}) : super(key: key);

  @override
  State<ProfessionalSwitchMainPage> createState() =>
      _ProfessionalSwitchMainPageState();
}

class _ProfessionalSwitchMainPageState
    extends State<ProfessionalSwitchMainPage> {
  int _index = 2;
  final items = <Widget>[
    const Icon(Icons.home),
    const Icon(Icons.article_outlined),
    const Icon(Icons.search),
    const Icon(Icons.settings),
    const Icon(Icons.supervised_user_circle_outlined),
  ];
  final screens = [
    const HomePage(),
    const ServicesPage(),
    const SearchPage(),
    const Setting(),
    const ProfilePageProfessional(),
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
        child: CurvedNavigationBar(
          key: navigationKey,
          backgroundColor: Colors.transparent,
          color: Colors.red,
          buttonBackgroundColor: const Color(ConstantColors.KPinkColor),
          items: items,
          animationCurve: Curves.easeIn,
          animationDuration: const Duration(milliseconds: 410),
          height: 60,
          index: _index,
          onTap: (index) {
            setState(() {
              _index = index;
              print(index);
            });
          },
        ),
      ),
      body: screens[_index],
    );
  }
}
