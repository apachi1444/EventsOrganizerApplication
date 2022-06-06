import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TextEditingController dateCtl = TextEditingController();
  TextEditingController firstNameCtl = TextEditingController();
  TextEditingController lastNameCtl = TextEditingController();
  TextEditingController ageCtl = TextEditingController();
  TextEditingController localisationCtl = TextEditingController();

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
                  height: 150,
                  color: Colors.black54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        size: 70,
                        color: Colors.white,
                      ),
                      Text(
                        'Change Cover Photo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
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
                        children: [
                          const CircleAvatar(
                            radius: 45,
                          ),
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.black54,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: const [
                                Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Change Profile Photo',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("haha");
                        ProfessionalDatabaseService(
                                uid: ProfessionalPreferences.getUid())
                            .changeProfessionalData(
                                firstNameCtl.text.trim(),
                                lastNameCtl.text.trim(),
                                localisationCtl.text.trim());
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
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                                color: Color(ConstantColors.KPinkColor)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Last Name',
                              labelStyle: TextStyle(
                                  color: Color(ConstantColors.KPinkColor))),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
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
