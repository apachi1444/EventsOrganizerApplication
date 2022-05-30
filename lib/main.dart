// new

// new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfs/StateNotifier/count_model.dart';
import 'package:pfs/screens/authPages/log_in_as_a_guest_page.dart';
import 'package:pfs/screens/guestPages/events/budget/BudgetPage.dart';
import 'package:pfs/screens/guestPages/events/event/todoList_page.dart';
import 'package:pfs/screens/guestPages/home/home_page_guest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuest.dart';
import 'package:pfs/screens/sharedScreens/search/searchPage.dart';
import 'package:pfs/screens/userPages/parametersPages/services/servicesPage.dart';
import 'package:pfs/screens/userPages/parametersPages/settings/settings_page.dart';
import 'package:pfs/screens/userPages/profile/profilePageProfTest.dart';
import 'package:pfs/switch_between_pages/signup_login_toggle.dart';
import 'package:provider/provider.dart';

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
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          // this is the wrapper to navigate us to the appropriate route when the user do the login
          '/': (context) => const WrapperPage(),

          // This is for the guest pages
          // ------------------------------------ //
          '/loginGuest': (context) => const LogInAsAGuestPage(),
          '/guest/profilePage': (context) => const ProfilePageGuest(),
          '/guest/homePage': (context) => const HomePageGuest(),
          '/guest/eventPage': (context) => const ProfilePageGuest(),
          '/guest/eventPage/todoList': (context) => const TodoList(),
          '/guest/eventPage/guestPages': (context) => const ProfilePageGuest(),
          '/guest/eventPage/professionalsList': (context) =>
              const ProfilePageGuest(),
          '/guest/eventPage/budgetPages': (context) => const BudgetPage(),
          '/guest/searchPage': (context) => const SearchPage(),
          // ------------------------------------ //

          // ------------------------------------ //
          // This is For the Professional Pages
          '/authProfessional': (context) => const AuthSwitchPage(),
          '/professional/profilePage': (context) =>
              const ProfilePageProfessional(),
          '/professional/profilePage/editProfile': (context) =>
              const ProfilePageProfessional(),
          '/professional/profilePage/settings': (context) => const Setting(),
          '/professional/profilePage/forgetPassword/firstPage': (context) =>
              const Setting(),
          '/professional/profilePage/forgetPassword/secondPage': (context) =>
              const ProfilePageProfessional(),
          '/professional/profilePage/forgetPassword/thirdPage': (context) =>
              const ProfilePageProfessional(),
          '/professional/profilePage/services': (context) =>
              const ServicesPage(),
          // ------------------------------------ //
        },
      ),
    );
  }
}
