// new

// new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfs/StateNotifier/count_model.dart';
import 'package:pfs/extensions/routes.dart';
import 'package:provider/provider.dart';

import 'extensions/utils.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel()),
      ],
      child: MaterialApp(
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
        routes: routesApplication,
      ),
    );
  }
}
