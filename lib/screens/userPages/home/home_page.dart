import 'package:flutter/material.dart';
import 'package:pfs/screens/userPages/home/homePageParts/RowFilterSearchHomePage.dart';
import 'package:pfs/screens/userPages/home/homePageParts/professionalSlider.dart';

import '../../../extensions/navbar/navbarButtom.dart';
import 'homePageParts/CategoryNameAndViewAllRow.dart';
import 'homePageParts/navbarItemHomePage.dart';

class HomePageGuest extends StatefulWidget {
  const HomePageGuest({Key? key}) : super(key: key);

  @override
  State<HomePageGuest> createState() => _HomePageGuestState();
}

class _HomePageGuestState extends State<HomePageGuest> {
  bool isMine = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (isMine) {
      return Scaffold(
          bottomNavigationBar: const NavBarButtom(), body: Container());
    } else {
      return SafeArea(
        child: Scaffold(
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
          body: SingleChildScrollView(
            child: Center(
                child: Column(children: const <Widget>[
              NavbarItemHomePage(),
              SizedBox(height: 7),
              RowFilterSearchHomePage(),
              SizedBox(height: 10),

              //

              CategoryNameAndViewAllRow(),

              SizedBox(height: 15),

              // here will do the scroll bar horizontal

              ProfessionalSlider(),

              CategoryNameAndViewAllRow(),

              SizedBox(height: 15),

              // here will do the scroll bar horizontal

              ProfessionalSlider(),

              SizedBox(height: 20),
            ])),
          ),
        ),
      );
    }
  }
}
