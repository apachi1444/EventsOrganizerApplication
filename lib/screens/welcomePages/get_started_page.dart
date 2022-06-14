import 'package:flutter/material.dart';
import 'package:pfs/screens/welcomePages/welcome_page_one.dart';

import 'navbarItemsStartedPages/navbarItemStartPages.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isDark = Provider.of<CounterModel>(context , listen : false).toggle();
    // print('this is the value of our state in the provider ' + isDark );
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFF8),
      body: Center(
          child: Column(children: <Widget>[
            const NavBarItemStartPages(),
           const SizedBox(height: 30),

        const SizedBox(height: 90),
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
                    return const WelcomePageOne();
                  }));
                },
                child: const Center(
                  child: Text('Get Started',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                ),
              ),
            )),
      ])),
    );
  }
}
