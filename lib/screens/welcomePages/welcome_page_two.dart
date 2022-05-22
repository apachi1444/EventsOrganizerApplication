import 'package:flutter/material.dart';
import 'package:pfs/screens/welcomePages/select_role_login.dart';
import 'package:pfs/screens/welcomePages/welcome_page_one.dart';
import 'package:pfs/screens/welcomePages/welcome_page_three.dart';

import 'navbarItemsStartedPages/navbarItemStartPages.dart';

class WelcomePageTwo extends StatelessWidget {
  const WelcomePageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFF8),
      body: Center(
          child: Column(children: <Widget>[
        const NavBarItemStartPages(),
        const SizedBox(height: 30),
        const Text('Who Are We',
            style: TextStyle(
              color: Color(0XFFFF006B),
              fontSize: 40,
            )),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Container(
            child: const Text(
              'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'roboto',
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color(0XFFF8F4F4),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ]),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const WelcomePageThree();
                  }));
                },
                child: const Center(
                  child: Text('Continue',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            )),
        const SizedBox(height: 30),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const WelcomePageOne();
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0XFFFF006B).withOpacity(0.25),
                borderRadius: BorderRadius.circular(20),
              ),
              // 6 15
              // 8 18
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0XFFFF006B),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const WelcomePageThree();
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0XFFFF006B).withOpacity(0.25),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            ),
          ),
        ]),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SelectRoleLogin();
            }));
          },
          child: const Text('Skip Here ! ',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
        )
      ])),
    );
  }
}
