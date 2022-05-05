import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import '../screens/userPages/home_page.dart';
import '../screens/authPages/login_page.dart';
import 'auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : StreamBuilder<User?>(
        stream : FirebaseAuth.instance.authStateChanges(),
        builder :(context , snapshot){
          if (snapshot.hasData){
            return HomePage();
          }else{
            return AuthPage();
          }
        }
      )
    );
  }
}
