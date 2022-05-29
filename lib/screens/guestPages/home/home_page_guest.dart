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
    var itemData = [
      const Text('ahah this is the first text '),
      const Text('ahah this is the first text '),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: <Widget>[
          const NavbarItemHomePage(
            firstName: 'Yessine', lastName: 'Jaguar',
            // firstName: user.hashCode.toString(),
            // lastName: user.hashCode.toString(),
          ),
          const SizedBox(height: 7),
          const RowFilterSearchHomePage(),
          const SizedBox(height: 10),
          const CategoryNameAndViewAllRow(),
          const SizedBox(height: 15),
          const ProfessionalSlider(),
          const SizedBox(height: 15),
          const CategoryNameAndViewAllRow(),
          const SizedBox(height: 15),
          const ProfessionalSlider(),
          const SizedBox(height: 20),
          ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // <-- this will disable scroll
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return itemData[index];
            },
            itemCount: itemData.length,
          )
        ])),
      ),
    );
  }
}
