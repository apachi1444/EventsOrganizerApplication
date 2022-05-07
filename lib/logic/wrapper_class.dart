import "package:flutter/material.dart";
import 'package:pfs/screens/authPages/log_in_as_a_guest_page.dart';
import 'package:pfs/screens/welcomePages/get_started_page.dart';

import '../screens/authPages/login_page.dart';


class WrapperElement extends StatelessWidget {
  const WrapperElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LogInAsAGuestPage();
  }
}
