import 'package:flutter/cupertino.dart';
import 'package:pfs/screens/guestPages/guestSwitchMainPage.dart';
import 'package:pfs/screens/guestPages/professional/professionalDetail.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/stepsWhenPlusButton/failureStep.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/stepsWhenPlusButton/succesStep.dart';
import 'package:pfs/screens/professionalPages/professionalSwitchMainPage.dart';

import '../logic/wrapper_class.dart';
import '../screens/authPages/log_in_as_a_guest_page.dart';
import '../screens/guestPages/events/budget/BudgetPage.dart';
import '../screens/guestPages/events/event/todoList_page.dart';
import '../screens/guestPages/home/home_page_guest.dart';
import '../screens/guestPages/profilePage/profilePageGuest.dart';
import '../screens/guestPages/searchPage/search_page.dart';
import '../screens/professionalPages/parametersPages/services/servicesPage.dart';
import '../screens/professionalPages/parametersPages/settings/settings_page.dart';
import '../screens/sharedScreens/search/searchPage.dart';
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
  '/guest/eventPage/guestPages': (context) => const ProfilePageGuest(),
  '/guest/eventPage/professionalsList': (context) => const ProfilePageGuest(),
  '/guest/eventPage/budgetPages': (context) => const BudgetPage(),
  '/guest/searchPage': (context) =>  SearchScreen(),
  '/guest/guestSwitchMainPage': (context) =>  const GuestSwitchMainPage(),
// ------------------------------------ //

// ------------------------------------ //
// This is For the Professional Pages
  '/authProfessional': (context) => const AuthSwitchPage(),
  '/professional/switchMainPage': (context) => const ProfessionalSwitchMainPage(),
  '/professional/profilePage/services': (context) => const ServicesPage(),
  '/professional/profilePage/editProfile/updatedSuccessfully': (context) =>
      const SuccesStep(),
  '/professional/profilePage/editProfile/updatingError': (context) =>
      const FailureStep(),
// ------------------------------------ //
};
