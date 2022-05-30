// import 'package:firebase_auth/firebase_auth.dart';
// import "package:flutter/material.dart";
// import 'package:pfs/logic/auth_page.dart';
// import 'package:pfs/screens/authPages/log_in_as_a_guest_page.dart';
// import 'package:pfs/screens/welcomePages/get_started_page.dart';
// import 'package:pfs/screens/welcomePages/welcome_page_one.dart';
// import 'package:provider/provider.dart';
//
// import '../Models/Userr.dart';
// import '../screens/authPages/login_page.dart';
// import '../screens/userPages/home_page_test_animation.dart';
//
//
// class WrapperElement extends StatelessWidget {
//
//   // the wrapper class will listen for Auth Changes
//   // and we need the provider to pass the auth changes to all the widgets
//
//   const WrapperElement({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<Userr?>(context);
//     print(user?.uid);
//     if (user == null) {
//       print("the fkkkkk null valuein in the wrapper WrapperElement");
//       // we have to discuss it because id depends on the first time visit of our user
//       return const GetStartedPage();
//     }
//     else {
//       print("haaaaaaaaaaaaaaaaaaaaaaaaaaaaa returning the home page in the wrapper WrapperElement");
//       return const HomePage();
//       // }
//       // return StreamBuilder<User?>(
//       //     stream : FirebaseAuth.instance.authStateChanges(),
//       //     builder :(context , snapshot){
//       //       if (snapshot.hasData){
//       //         print(snapshot);
//       //         return HomePage();
//       //       }else{
//       //         return GetStartedPage();
//       //       }
//       //     }
//       // );
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/guestSwitchMainPage.dart';
import 'package:pfs/screens/userPages/professionalSwitchMainPage.dart';
import 'package:pfs/screens/welcomePages/get_started_page.dart';
import 'package:provider/provider.dart';

import '../StateNotifier/count_model.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  @override
  Widget build(BuildContext context) {
    final providerOfCountModel = Provider.of<CounterModel>(context).getIsDark();
    print("this is the response of the provider");
    print(providerOfCountModel);
    print('we are in the wrapper class');
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              } else if (snapshot.hasData) {
                if (snapshot.data?.isAnonymous == false) {
                  return const ProfessionalSwitchMainPage();
                } else {
                  return const GuestSwitchMainPage();
                }
              } else {
                return const GetStartedPage();
              }
            }));
  }
}
