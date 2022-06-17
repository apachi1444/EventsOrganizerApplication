import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/services/authService.dart';

import '../../../../extensions/constants.dart';
import '../../../../services/settingsServices.dart';

final _settingsService =
    SettingsService(professionalUid: AuthService().getCurrentIdUser());

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('My Settings'),
          ),
          backgroundColor: const Color(ConstantColors.KPinkColor),
        ),
        body: const MySetting(),
      ),
    );
  }
}

class MySetting extends StatefulWidget {
  const MySetting({Key? key}) : super(key: key);

  @override
  State<MySetting> createState() => MySettingState();
}

class MySettingState extends State<MySetting> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction(bool val, String title) {
    switch (title) {
      case 'Show Profile To Others':
        setState(() {
          valNotify1 = val;
        });
        _settingsService.settingOnOrOff(title, val);
        break;
      case 'Allow Recommendations':
        setState(() {
          valNotify2 = val;
        });
        _settingsService.settingOnOrOff(title, val);
        break;
      case 'Allow Comments':
        setState(() {
          valNotify3 = val;
        });
        _settingsService.settingOnOrOff(title, val);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final professional = _settingsService.readOneProfessional();
    return StreamBuilder<DocumentSnapshot>(
      stream: professional,
      builder: (BuildContext context, snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.add_moderator,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Privacy Settings',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_circle_right_rounded),
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1.5,
                    color: Colors.black,
                  ),
                  buildNotificationOption(
                      'Show Profile To Others', valNotify1, onChangeFunction),
                  buildNotificationOption(
                      'Allow Recommendations', valNotify2, onChangeFunction),
                  buildNotificationOption(
                      'Allow Comments', valNotify3, onChangeFunction),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              )
            ],
          ),

          // SafeArea
        );
      },
    );
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangeMethode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.person,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: const Color(ConstantColors.KGreenColor),
              trackColor: const Color(ConstantColors.KPinkColor),
              value: value,
              onChanged: (bool newValue) {
                onChangeMethode(newValue, title);
                _settingsService.settingOnOrOff(title, newValue);
              },
            ),
          )
        ],
      ),
    );
  }

// Padding footer(String title, bool value, Function onChangeMethode) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Icon(
//           Icons.person,
//         ),
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         Transform.scale(
//           scale: 0.7,
//           child: CupertinoSwitch(
//             activeColor: const Color(ConstantColors.KGreenColor),
//             trackColor: const Color(ConstantColors.KPinkColor),
//             value: value,
//             onChanged: (bool newValue) {
//               onChangeMethode(newValue);
//             },
//           ),
//         )
//       ],
//     ),
//   );
// }
}
