import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/events/budget/BudgetPage.dart';
import 'package:pfs/screens/guestPages/events/chickList/MyChickList.dart';
import 'package:pfs/screens/guestPages/home/home_page_guest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuest.dart';

import '../../extensions/constants.dart';
import '../sharedScreens/search/searchPage.dart';

class GuestSwitchMainPage extends StatefulWidget {
  final uid;
  const GuestSwitchMainPage({Key? key, this.uid}) : super(key: key);

  @override
  State<GuestSwitchMainPage> createState() => _GuestSwitchMainPageState();
}

class _GuestSwitchMainPageState extends State<GuestSwitchMainPage> {
  int _index = 0;

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
    const HomePageGuest(),
    const MyCheckingList(),
    const SearchPage(),
    const BudgetPage(),
    const ProfilePageGuest(),
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
        ),
      ),
      body: screens[_index],
    );
  }
}
