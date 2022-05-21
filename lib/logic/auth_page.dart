import 'package:flutter/material.dart';

import '../screens/authPages/login_page.dart';
import '../screens/authPages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true ;


  void toggleScreens(){
    setState((){
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if ( showLoginPage ) {
      return  LoginPage(toggleView : toggleScreens);
    } else {
      return RegisterPage(toggleView : toggleScreens );
    }
  }

}
