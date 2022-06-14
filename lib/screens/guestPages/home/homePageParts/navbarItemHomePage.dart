import 'package:flutter/material.dart';

class NavbarItemHomePage extends StatelessWidget {
  final String? firstName;
  const NavbarItemHomePage(
      {Key? key, required this.firstName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(35),
              bottomLeft: Radius.circular(35)),
          color: Color(0XFFFF006B),
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20.0,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/googleIcon.png'),
                radius: 17.0,
              ),
            ),
            Text('Welcome $firstName!'),
            // Material(
            //   borderRadius: BorderRadius.circular(50),
            //   child: InkWell(
            //     splashColor: Colors.red, // Splash color
            //     onTap: () {
            //       print('sdlhhkf');
            //     },
            //     child: const SizedBox(
            //         width: 56, height: 56, child: Icon(Icons.arrow_downward)),
            //   ),
            // )
          ],
        ));
  }
}
