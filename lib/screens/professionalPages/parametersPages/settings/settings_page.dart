import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/constants.dart';
import '../../../guestPages/events/chickList/MyChickList.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('My Settings'),
        ),
        backgroundColor: const Color(ConstantColors.KPinkColor),
      ),
      body: const MySetting(),
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
  bool valNotify12 = true;
  bool valNotify22 = false;
  bool valNotify32 = false;

  onChangeFunction1(bool newVAlue1) {
    setState(() {
      valNotify1 = newVAlue1;
    });
  }

  onChangeFunction2(bool newVAlue2) {
    setState(() {
      valNotify2 = newVAlue2;
    });
  }

  onChangeFunction3(bool newVAlue3) {
    setState(() {
      valNotify3 = newVAlue3;
    });
  }

  onChangeFunction12(bool newVAlue12) {
    setState(() {
      valNotify12 = newVAlue12;
    });
  }

  onChangeFunction22(bool newVAlue2) {
    setState(() {
      valNotify22 = newVAlue2;
    });
  }

  onChangeFunction32(bool newVAlue3) {
    setState(() {
      valNotify32 = newVAlue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
                  'Show Profile To Others', valNotify1, onChangeFunction1),
              buildNotificationOption(
                  'Allow Recommendations', valNotify2, onChangeFunction2),
              buildNotificationOption(
                  'Show Profile To others', valNotify3, onChangeFunction3),
              const SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),

      // SafeArea
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
                onChangeMethode(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  Padding fotter(String title, bool value, Function onChangeMethode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
                onChangeMethode(newValue);
              },
            ),
          )
        ],
      ),
    );
  }
}
