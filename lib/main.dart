// new

// new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfs/screens/userPages/home/professionalsPart/professionalDetail.dart';

// new

import 'extensions/utils.dart';
import 'logic/wrapper_class.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => ApplicationState(),
  //     builder: (context, _) => const App(),
  //   ),
  // );
  runApp(const App());
}

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Firebase Meetup',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const WrapperPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/profile/professionalDetail': (context) => const ProfessionalDetail(),
      },
    );
  }
}
