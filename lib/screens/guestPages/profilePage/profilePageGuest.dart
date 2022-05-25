import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuestComponents/buttonContatctUsProfilePageGuest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuestComponents/buttonParameterProfilePageGuest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuestComponents/navImageGuestProfilePage.dart';

import '../../../extensions/constant_colors.dart';

class ProfilePageGuest extends StatelessWidget {
  const ProfilePageGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: const [
        NavImageGuestProfilePage(),
        SizedBox(height: 15),
        Text(
          'Micheal Boston',
          style: TextStyle(
              color: Color(ConstantColors.KPinkColor),
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        SizedBox(height: 15),
        ButtonParameterProfilePageGuest(text: 'Edit Profile', logo: Icons.edit),
        SizedBox(height: 15),
        ButtonParameterProfilePageGuest(text: 'Log Out', logo: Icons.logout),
        SizedBox(height: 15),
        Text('Do You Have Any Problem ?'),
        SizedBox(height: 15),
        ButtonContactUsProfilePageGuest(),
      ],
    ));
  }
}
