import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/professionalPages/parametersPages/editProfile/editProfileParts/buttonUpdate.dart';
import 'package:pfs/screens/professionalPages/parametersPages/editProfile/edit_profile_screen.dart';
import 'package:pfs/sharedPreferences/ProfessionalPreferences.dart';

import '../../../../extensions/constants.dart';
import '../../../../services/authService.dart';
import 'editProfileParts/allRowsOfFieldsProfessionalData.dart';
import 'editProfileParts/imageAboveTheContainer.dart';
import 'editProfileParts/wholeContainerOfUpdatingDataProfessional.dart';

class EditProfileProfessionalPage extends StatelessWidget {
  const EditProfileProfessionalPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    print(userId);
    // return SafeArea(
    //   child: Scaffold(
    //       body: SingleChildScrollsView(
    //     child: Column(children: [
    //       const ImageAboveTheContainer(),
    //       const WholeContainerOfUpdatingDataProfessional(),
    //       AllRowsOfFieldsProfessionalData(),
    //       const SizedBox(height: 15),
    //       const ButtonUpdate(text: 'Update', logo: Icons.update),
    //     ]),
    //   )),
    // );
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                    color: Color(ConstantColors.KPinkColor),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/avatar.jpg'))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: PopupMenuButton(
                            icon: const Icon(Icons.logout,
                                color: Colors.white, size: 30),
                            itemBuilder: (_) {
                              return <PopupMenuItem<String>>[
                                const PopupMenuItem(
                                    child: Text('Logout'), value: 'logout')
                              ];
                            },
                            onSelected: (index) {
                              AuthService().signOut();
                            }),
                      )
                    ])),
            Container(
                transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('assets/googleIcon.png'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const EditProfileScreen(key: null);
                            }));
                          },
                          child: Container(
                              width: 100,
                              height: 35,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  border: Border.all(
                                    color:
                                        const Color(ConstantColors.KPinkColor),
                                  )),
                              child: const Center(
                                  child: Text('Edit',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(ConstantColors.KPinkColor),
                                        fontWeight: FontWeight.bold,
                                      )))),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                )),
            AllRowsOfFieldsProfessionalData()
          ],
        ));
  }
}

Map<int, Widget> profileTabs = {
  0: const Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text('Profile'),
  )
};
