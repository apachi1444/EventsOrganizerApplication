import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/events/budget/BudgetPage.dart';
import 'package:pfs/screens/guestPages/events/chickList/MyChickList.dart';
import 'package:pfs/screens/guestPages/home/home_page_guest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuest.dart';

import '../../extensions/constant_colors.dart';
import '../sharedScreens/search/searchPage.dart';

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
    const Icon(Icons.article_outlined),
    const Icon(Icons.search_off),
    const Icon(Icons.account_balance_outlined),
    const Icon(Icons.person),
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
