import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfs/screens/professionalPages/parametersPages/editProfile/edit_profile_page.dart';
import 'package:pfs/screens/professionalPages/profile/profilePageProfTest.dart';
import 'package:pfs/services/professionalDbService.dart';
import 'package:pfs/sharedPreferences/ProfessionalPreferences.dart';

import '../../../../extensions/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final bool _isLoading = false;
  TextEditingController firstNameCtl = TextEditingController();
  TextEditingController lastNameCtl = TextEditingController();
  TextEditingController localisationCtl = TextEditingController();

  String? firstName = ProfessionalPreferences.getFirstName();
  String? lastName = ProfessionalPreferences.getLastName();
  String? localisation = ProfessionalPreferences.getLocalisation();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameCtl = TextEditingController(text: '$firstName');
    lastNameCtl = TextEditingController(text: '$lastName');
    localisationCtl = TextEditingController(text: '$localisation');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  height: 150,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: const BoxDecoration(
                        color: Color(ConstantColors.KPinkColor),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/avatar.jpg'))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: PopupMenuButton(
                                icon: const Icon(
                                    Icons.arrow_circle_left_rounded,
                                    color: Colors.white,
                                    size: 50),
                                itemBuilder: (_) {
                                  return <PopupMenuItem<String>>[
                                    const PopupMenuItem(
                                        child: Text('Go Back'), value: 'logout')
                                  ];
                                },
                                onSelected: (index) {
                                  Navigator.pop(
                                    context,
                                  );
                                }),
                          )
                        ]))
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -40, 0),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: const [
                          CircleAvatar(
                            radius: 45,
                          ),
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.black54,
                            backgroundImage:
                                AssetImage('assets/googleIcon.png'),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(lastNameCtl.text.trim());
                        ProfessionalDatabaseService(
                                uid: ProfessionalPreferences.getUid())
                            .changeProfessionalData(
                                firstNameCtl.text.trim(),
                                lastNameCtl.text.trim(),
                                localisationCtl.text.trim())
                            .then((value) {
                          Fluttertoast.showToast(
                              timeInSecForIosWeb: 1,
                              msg: 'Updated successfully',
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 25);
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 35,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(ConstantColors.KPinkColor)),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: firstNameCtl,
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                                color: Color(ConstantColors.KPinkColor)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: lastNameCtl,
                          decoration: const InputDecoration(
                              labelText: 'Last Name',
                              labelStyle: TextStyle(
                                  color: Color(ConstantColors.KPinkColor))),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: localisationCtl,
                          decoration: const InputDecoration(
                              labelText: 'Localisation',
                              labelStyle: TextStyle(
                                  color: Color(ConstantColors.KPinkColor))),
                        ),
                        // const SizedBox(height: 10),
                        // TextFormField(
                        //     decoration: const InputDecoration(
                        //         labelText: 'Birth Date',
                        //         labelStyle: TextStyle(
                        //             color: Color(ConstantColors.KPinkColor))),
                        //     onTap: () async {
                        //       DateTime? date = DateTime(1900);
                        //       FocusScope.of(context).requestFocus(FocusNode());
                        //
                        //       date = await showDatePicker(
                        //           context: context,
                        //           initialDate: DateTime.now(),
                        //           firstDate: DateTime(1900),
                        //           lastDate: DateTime(2100));
                        //       dateCtl.text = date.toString();
                        //     }),
                        const SizedBox(height: 30),
                        _isLoading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.green),
                              )
                            : const SizedBox.shrink()
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
