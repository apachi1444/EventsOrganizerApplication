import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/userPages/home_page_test_animation.dart';
import 'package:pfs/screens/userPages/parametersPages/services/servicesPage.dart';

import '../../extensions/constant_colors.dart';
import '../guestPages/profilePage/profilePageGuest.dart';

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
    const Icon(Icons.home),
    const Icon(Icons.design_services)
  ];
  final screens = [
    const HomePage(),
    const ProfilePageGuest(),
    const ServicesPage()
  ];
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.green)),
        child: CurvedNavigationBar(
          key: navigationKey,
          backgroundColor: Colors.blue,
          color: Colors.red,
          buttonBackgroundColor: const Color(ConstantColors.KGreyColor),
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
