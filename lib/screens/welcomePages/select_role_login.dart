import 'package:flutter/material.dart';
import 'package:pfs/screens/welcomePages/welcomePagesParts/buttonWelcomePages.dart';

import 'navbarItemsStartedPages/navbarItemStartPages.dart';

class SelectRoleLogin extends StatelessWidget {
  const SelectRoleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFF8),
      body: Center(
          child: Column(children: const <Widget>[
        NavBarItemStartPages(),
        SizedBox(height: 70),
        ButtonWelcomePages(textInsideButton: 'Start The Adventure'),
        SizedBox(height: 20),
        ButtonWelcomePages(textInsideButton: 'Join As A Professional'),
      ])),
    );
  }
}
