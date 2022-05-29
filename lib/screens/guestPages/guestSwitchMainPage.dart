import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/home/home_page_guest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuest.dart';
import 'package:pfs/screens/userPages/parametersPages/settings/settings_page.dart';

import '../../extensions/constant_colors.dart';

class GuestSwitchMainPage extends StatefulWidget {
  final uid;
  const GuestSwitchMainPage({Key? key, this.uid}) : super(key: key);

  @override
  State<GuestSwitchMainPage> createState() => _GuestSwitchMainPageState();
}

class _GuestSwitchMainPageState extends State<GuestSwitchMainPage> {
  int _index = 1;
  final items = <Widget>[
    const Icon(Icons.home),
    const Icon(Icons.supervised_user_circle_rounded),
    const Icon(Icons.settings),
  ];
  final screens = [
    const HomePageGuest(),
    const ProfilePageGuest(),
    const Setting()
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
