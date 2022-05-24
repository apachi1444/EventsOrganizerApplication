import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../userPages/parametersPages/settings/settings_page.dart';

class MyCheckingList extends StatelessWidget {
  const MyCheckingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: const Center(
              child: Text('My Checking List'),
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 0, 107),
        ),
        // backgroundColor: Color.fromARGB(255, 198, 127, 121),

        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                // color: Color.fromARGB(255, 231, 178, 204),
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),

            child: Column(
              children: [
                //GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10),

                MainCard("My check List"),

                MainCard("My Plannning"),

                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 0, 107),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: const Color.fromARGB(255, 255, 255, 255)),
                    onPressed: () => {
                      print(
                          'You pressed the button.!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'),
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Setting()),
                      )
                    },
                    child: const Text('+',
                        style: TextStyle(
                          fontSize: 50,
                        )),
                  ),
                )

                //),
              ],
            ),

            // child: Container(
            //    child : const Text("My checklist asmae ",style: TextStyle(fontSize: 18),),
            //
            //
            //
            //   decoration: BoxDecoration(
            //
            //     border: Border.all(
            //         color: const Color(0xFF000000),
            //         width: 2.0,
            //         style: BorderStyle.values.first,), //Border.all
            //     /*** The BorderRadius widget  is here ***/
            //     borderRadius: const BorderRadius.all(
            //       Radius.circular(20),
            //     ), //BorderRadius.all
            //   ), //BoxDecoration
            // ),
          ),
        ), // SafeArea
      ),
    );
  }
// SwitchSettingsTile
}

Padding CheckingCard(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    child: Container(
      width: 100,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 248, 244, 244),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            blurRadius: 7.0,
            offset: Offset(
              5,
              5,
            ),
          ),
        ],
      ),
      child: Container(
        child: Column(
          //mainAxisSize: MainAxisSize.min,

          children: [
            SizedBox(height: 15),
            Icon(
              icon,
              size: 40,
            ), //text=Icons.account_balance
            Align(
              alignment: Alignment.topRight,
              child: ListTile(
                title: Text(
                  title,
                ),
                subtitle: Text('0/100'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Padding MainCard(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 252, 252, 252),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Container(
        child: Column(
          children: [
            Text(title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 15),
            Row(
              children: [
                CheckingCard("Guist", Icons.account_balance),
                CheckingCard("Guist", Icons.article),
                CheckingCard("Guist", Icons.wallet_travel),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
