import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/constants.dart';
import '../../../guestPages/events/chickList/MyChickList.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MySetting(),
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
  int _currentIndex = 0;

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
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('My Settings'),
        ),
        leading: IconButton(
          onPressed: () {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCheckingList(),
                  ));
            });
          },
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(ConstantColors.KPinkColor),
      ),
      // backgroundColor: Color.fromARGB(255, 198, 127, 121),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.add_moderator,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Privacy Settings',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                    const Icon(Icons.arrow_downward),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 10,
                ),
                buildNotificationOption(
                    "Show Profile To Others", valNotify1, onChangeFunction1),
                buildNotificationOption(
                    "Allow Recommendations", valNotify2, onChangeFunction2),
                buildNotificationOption(
                    "Show Profile To others", valNotify3, onChangeFunction3),
                const SizedBox(
                  height: 40,
                ),

// others Settings
                Row(
                  children: [
                    const Icon(
                      Icons.add_moderator,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Others Settings',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                    const Icon(Icons.arrow_downward),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                buildNotificationOption(
                    "Show Profile To Others", valNotify12, onChangeFunction12),
                buildNotificationOption(
                    "Allow Recommendations", valNotify22, onChangeFunction22),
                buildNotificationOption(
                    "Show Profile To others", valNotify32, onChangeFunction32),

                const SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
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
