import 'package:flutter/material.dart';
import 'package:pfs/Models/Userr.dart';
import 'package:pfs/logic/wrapper_class.dart';
import 'package:pfs/screens/calculatrice_page.dart';
import 'package:pfs/screens/authPages/login_page.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:pfs/screens/welcomePages/get_started_page.dart';
import 'package:pfs/screens/welcomePages/welcome_page_one.dart';
import 'package:pfs/services/authService.dart';
import 'package:provider/provider.dart';

import 'StateNotifier/count_model.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(ChangeNotifierProvider(
  //     create : (context) => CounterModel(),
  //     child: const MyApp()));
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userr?>(
      initialData:  null,
      // what stream we gonna listen to
      // and what data we want to get back
      create: (_) => AuthService().get(),
      child: const MaterialApp(
        debugShowCheckedModeBanner:  false ,
        home: WrapperElement(),
      ),
    );
    // return MaterialApp(
    //   home : const WrapperElement(),
    // );
  }
}


