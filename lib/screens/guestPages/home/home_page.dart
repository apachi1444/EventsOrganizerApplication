import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePageParts/CategoryNameAndViewAllRow.dart';
import 'homePageParts/RowFilterSearchHomePage.dart';
import 'homePageParts/navbarItemHomePage.dart';
import 'homePageParts/professionalSlider.dart';

class HomePageGuest extends StatelessWidget {
  const HomePageGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: const <Widget>[
          NavbarItemHomePage(
            firstName: 'Yessine', lastName: 'Jaguar',
            // firstName: user.hashCode.toString(),
            // lastName: user.hashCode.toString(),
          ),
          SizedBox(height: 7),
          RowFilterSearchHomePage(),
          SizedBox(height: 10),
          CategoryNameAndViewAllRow(),
          SizedBox(height: 15),
          ProfessionalSlider(),
          SizedBox(height: 15),
          CategoryNameAndViewAllRow(),
          SizedBox(height: 15),
          ProfessionalSlider(),
          SizedBox(height: 20),
        ])),
      ),
    );
  }
}
