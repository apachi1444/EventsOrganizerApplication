import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pfs/Models/Service.dart';
import 'package:pfs/screens/guestPages/events/budget/BudgetPage.dart';
import 'package:pfs/screens/guestPages/events/chickList/MyChickList.dart';
import 'package:pfs/screens/guestPages/home/home_page_guest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuest.dart';
import 'package:pfs/screens/guestPages/searchPage/search_page.dart';
import 'package:pfs/screens/professionalPages/parametersPages/settings/settings_page.dart';
import 'package:pfs/sharedPreferences/GuestPreferences.dart';
import 'package:provider/provider.dart';

import '../../extensions/constants.dart';
import '../../services/guestService.dart';
import '../sharedScreens/search/searchPage.dart';
import 'events/chickList/MyChickList.dart';
import 'home/home_page_guest.dart';

class GuestSwitchMainPage extends StatefulWidget {
  const GuestSwitchMainPage({Key? key}) : super(key: key);

  @override
  State<GuestSwitchMainPage> createState() => _GuestSwitchMainPageState();
}

class _GuestSwitchMainPageState extends State<GuestSwitchMainPage> {
  int _index = 2;

  void _navigateBottomBar(int index) {
    setState(() {
      _index = index;
    });
  }

  final items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.list_outlined), label: 'CheckList'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Recommendation'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  final screens = [
    const HomePageGuest(),
    const MyCheckingList(),
    SearchScreen(),
    const BudgetPage(),
    const ProfilePageGuest(),
  ];
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    // return StreamProvider<List<Service>>.value(
    //   initialData: const [],
    //   value:
    //       GuestService(guestUid: '').listProfessionalsWithSameCity('Marrakech'),
      return  Scaffold(
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


//
// Container(
// margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16),
// child: TextField(
// controller: searchController,
// decoration: InputDecoration(
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(15),
// borderSide: const BorderSide(
// color: Color(ConstantColors.KPinkColor),
// )),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(15),
// borderSide: const BorderSide(
// color: Color(ConstantColors.KPinkColor),
// )),
// contentPadding: const EdgeInsets.symmetric(vertical: 15),
// hintText: 'Search Your Post Here ...',
// hintStyle: const TextStyle(color: Colors.black),
// prefixIcon: const Icon(Icons.search,
// color: Color(ConstantColors.KPinkColor)),
//
// onPressed: () {
// clearSearch();
// },
// ),
// filled: true,
// ),
// onChanged: searchPost,
// ),
// )