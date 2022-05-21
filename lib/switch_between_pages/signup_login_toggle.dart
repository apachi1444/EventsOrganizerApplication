import 'package:flutter/material.dart';
import 'package:pfs/screens/authPages/login_page.dart';
import 'package:pfs/screens/authPages/registerr_page.dart';

class AuthSwitchPage extends StatefulWidget {
  const AuthSwitchPage({Key? key}) : super(key: key);

  @override
  State<AuthSwitchPage> createState() => _AuthSwitchPageState();
}

class _AuthSwitchPageState extends State<AuthSwitchPage> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginPage(toggleView: toggleView);
    } else {
      return RegisterrPage(toggleView: toggleView);
    }
  }
}
