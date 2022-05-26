import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuestComponents/buttonContatctUsProfilePageGuest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuestComponents/buttonParameterProfilePageGuest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuestComponents/navImageGuestProfilePage.dart';

import '../../../extensions/constant_colors.dart';
import '../../../services/authService.dart';

class ProfilePageGuest extends StatelessWidget {
  const ProfilePageGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const NavImageGuestProfilePage(),
        const SizedBox(height: 15),
        const Text(
          'Micheal Boston',
          style: TextStyle(
              color: Color(ConstantColors.KPinkColor),
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        const SizedBox(height: 15),
        ButtonParameterProfilePageGuest(
            text: 'Edit Profile',
            logo: Icons.edit,
            functionToDoWhenClickOnTheButton:
                AuthService().SignOut() as Function),
        const SizedBox(height: 15),
        // ButtonParameterProfilePageGuest(
        //     text: 'Log Out',
        //     logo: Icons.logout,
        //     functionToDoWhenClickOnTheButton:
        //         AuthService().SignOut() as Function),
        const SizedBox(height: 15),
        const Text('Do You Have Any Problem ?'),
        const SizedBox(height: 15),
        const ButtonContactUsProfilePageGuest(),
      ],
    ));
  }
}
