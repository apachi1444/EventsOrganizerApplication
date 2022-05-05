import 'package:flutter/material.dart';
import 'package:pfs/screens/calculatrice_page.dart';
import 'package:pfs/screens/authPages/login_page.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:pfs/screens/welcomePages/get_started_page.dart';
import 'package:pfs/screens/welcomePages/welcome_page_one.dart';

import 'logic/main_page.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false ,
      home: const GetStartedPage(),
    );
  }
}


