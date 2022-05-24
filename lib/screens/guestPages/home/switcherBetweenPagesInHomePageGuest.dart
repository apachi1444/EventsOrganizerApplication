import 'package:flutter/material.dart';
import 'package:pfs/services/authService.dart';

import '../../../extensions/navbar/navbarBottom.dart';
import '../profilePage/profilePageGuest.dart';
import 'home_page.dart';

class SwitcherBetweenPagesInHomePageGuest extends StatefulWidget {
  const SwitcherBetweenPagesInHomePageGuest({Key? key}) : super(key: key);

  @override
  State<SwitcherBetweenPagesInHomePageGuest> createState() =>
      _SwitcherBetweenPagesInHomePageGuestState();
}

class _SwitcherBetweenPagesInHomePageGuestState
    extends State<SwitcherBetweenPagesInHomePageGuest> {
  final screen = [
    const HomePageGuest(),
    const ProfilePageGuest(),
    const Text('this is the third element of our page')
  ];

  @override
  Widget build(BuildContext context) {
    var user = AuthService().getCurrentUser();
    var size = MediaQuery.of(context).size;
    int selectedIndex = 0;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:
            NavBarBottom(selectedIndex: selectedIndex, isGuest: true),
        // appBar: PreferredSize(
        //   preferredSize: Size(size.width, size.height * 0.1),
        //   child: AppBar(
        //     title: Text("Home"),
        //     leading : IconButton(
        //       onPressed:(){
        //
        //       },
        //       icon:Icon(Icons.search)
        //     ),
        //     // this is for the white part
        //     // for the safe area is used for eliminating the part in the top
        //     flexibleSpace: Container(
        //         decoration: const BoxDecoration(
        //           color: Colors.white,
        //         ),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Container(
        //               decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: Color(ConstantColors.activeColor),
        //               ),
        //               child: const CircleAvatar(
        //                 backgroundColor: Colors.white,
        //                 radius: 80.0,
        //                 child: CircleAvatar(
        //                   backgroundImage: AssetImage('assets/googleIcon.png'),
        //                   radius: 17.0,
        //                 ),
        //               ),
        //             ),
        //             Text("Welcome Micheal Boston"),
        //           ],
        //         )),
        //   ),
        // ),
        backgroundColor: const Color(0XFFFFFFF8),
        body: screen[selectedIndex],
      ),
    );
  }
}
