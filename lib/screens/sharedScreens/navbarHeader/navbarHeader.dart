import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class NavBarHeader extends StatefulWidget {
  const NavBarHeader({Key? key}) : super(key: key);

  @override
  State<NavBarHeader> createState() => _NavBarHeaderState();
}

class _NavBarHeaderState extends State<NavBarHeader> {
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
            Material(
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                splashColor: Colors.red, // Splash color
                onTap: () {
                  print('sdlhhkf');
                },
                child: const SizedBox(
                    width: 56, height: 56, child: Icon(Icons.arrow_downward)),
              ),
            ),
            const Text("My Settings",
                style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ));
  }
}
