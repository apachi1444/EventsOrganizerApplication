import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:pfs/logic/auth_page.dart';
import 'package:pfs/screens/authPages/log_in_as_a_guest_page.dart';
import 'package:pfs/screens/welcomePages/get_started_page.dart';
import 'package:pfs/screens/welcomePages/welcome_page_one.dart';
import 'package:provider/provider.dart';

import '../Models/Userr.dart';
import '../screens/authPages/login_page.dart';
import '../screens/userPages/home_page.dart';


class WrapperElement extends StatelessWidget {

  // the wrapper class will listen for Auth Changes
  // and we need the provider to pass the auth changes to all the widgets

  const WrapperElement({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr?>(context);
    print(user);
    if (user == null) {
      // we have to discuss it because id depends on the first time visit of our user
      return GetStartedPage();
    }
    else {
      return HomePage();
      // }
      // return StreamBuilder<User?>(
      //     stream : FirebaseAuth.instance.authStateChanges(),
      //     builder :(context , snapshot){
      //       if (snapshot.hasData){
      //         print(snapshot);
      //         return HomePage();
      //       }else{
      //         return GetStartedPage();
      //       }
      //     }
      // );
    }
  }
}