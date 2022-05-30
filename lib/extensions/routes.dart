import 'package:flutter/cupertino.dart';

import '../logic/wrapper_class.dart';
import '../screens/authPages/log_in_as_a_guest_page.dart';
import '../screens/guestPages/events/budget/BudgetPage.dart';
import '../screens/guestPages/events/event/todoList_page.dart';
import '../screens/guestPages/home/home_page_guest.dart';
import '../screens/guestPages/profilePage/profilePageGuest.dart';
import '../screens/sharedScreens/search/searchPage.dart';
import '../screens/userPages/parametersPages/services/servicesPage.dart';
import '../screens/userPages/parametersPages/settings/settings_page.dart';
import '../screens/userPages/profile/profilePageProfTest.dart';
import '../switch_between_pages/signup_login_toggle.dart';

Map<String, Widget Function(BuildContext context)> routesApplication = {
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
  '/guest/eventPage/professionalsList': (context) => const ProfilePageGuest(),
  '/guest/eventPage/budgetPages': (context) => const BudgetPage(),
  '/guest/searchPage': (context) => const SearchPage(),
// ------------------------------------ //

// ------------------------------------ //
// This is For the Professional Pages
  '/authProfessional': (context) => const AuthSwitchPage(),
  '/professional/profilePage': (context) => const ProfilePageProfessional(),
  '/professional/profilePage/editProfile': (context) =>
      const ProfilePageProfessional(),
  '/professional/profilePage/settings': (context) => const Setting(),
  '/professional/profilePage/forgetPassword/firstPage': (context) =>
      const Setting(),
  '/professional/profilePage/forgetPassword/secondPage': (context) =>
      const ProfilePageProfessional(),
  '/professional/profilePage/forgetPassword/thirdPage': (context) =>
      const ProfilePageProfessional(),
  '/professional/profilePage/services': (context) => const ServicesPage(),
// ------------------------------------ //
};
