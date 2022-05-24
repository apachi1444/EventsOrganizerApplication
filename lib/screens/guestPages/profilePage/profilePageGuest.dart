import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuestComponents/buttonContatctUsProfilePageGuest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuestComponents/buttonParameterProfilePageGuest.dart';
import 'package:pfs/screens/guestPages/profilePage/profilePageGuestComponents/navImageGuestProfilePage.dart';

class ProfilePageGuest extends StatelessWidget {
  const ProfilePageGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        children: const [
          NavImageGuestProfilePage(),
          Text('Micheal Boson'),
          ButtonParameterProfilePageGuest(
              text: 'Edit Profile', logo: Icons.edit),
          ButtonParameterProfilePageGuest(
              text: 'Edit Profile', logo: Icons.edit),
          Text('Do You Have Any Problem ?'),
          ButtonContactUsProfilePageGuest(),
        ],
      ),
    ));
  }
}
