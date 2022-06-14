import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavImageGuestProfilePage extends StatelessWidget {
  const NavImageGuestProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.28,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/elon-musk.jpg')),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(35),
              bottomLeft: Radius.circular(35)),
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                // Material(
                //   borderRadius: BorderRadius.circular(50),
                //   child: InkWell(
                //     splashColor: Colors.red, // Splash color
                //     onTap: () {
                //       // Navigator.pop(context);
                //     },
                //     child: const SizedBox(
                //         width: 34,
                //         height: 34,
                //         child: Icon(Icons.arrow_left_outlined)),
                //   ),
                // ),
              ],
            ),
          ],
        ));
  }
}
