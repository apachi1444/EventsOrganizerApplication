import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/wholeBoxContainingCategoryAndProfessionalDetail.dart';
import 'package:pfs/services/guestService.dart';
import 'package:pfs/sharedPreferences/GuestPreferences.dart';

import '../../../Models/Guest.dart';
import 'homePageParts/CategoryNameAndViewAllRow.dart';
import 'homePageParts/RowFilterSearchHomePage.dart';
import 'homePageParts/navbarItemHomePage.dart';
import 'homePageParts/professionalSlider.dart';

class HomePageGuest extends StatefulWidget {
  const HomePageGuest({Key? key}) : super(key: key);

  @override
  State<HomePageGuest> createState() => _HomePageGuestState();
}

class _HomePageGuestState extends State<HomePageGuest> {
  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    print('this is the user id of the guest dude');
    GuestService(guestUid: userId)
        .getGuestFromDocumentSnapshot()
        .then((value) {});
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: <Widget>[
            const NavbarItemHomePage(
              firstName: 'finalName',
            ),
            const SizedBox(height: 10),
            WholeBoxContainingCategoryAndProfessionalDetail(userId: userId),
            const SizedBox(height: 20),
            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   // <-- this will disable scroll
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) {
            //     return itemData[index];
            //   },
            //   itemCount: itemData.length,
            // )
          ])),
        ),
      ),
    );
  }
}
