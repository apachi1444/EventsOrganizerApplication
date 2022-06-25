import 'package:flutter/material.dart';

import '../../../../extensions/utils.dart';

class NavbarItemProfessionalDetail extends StatelessWidget {
  const NavbarItemProfessionalDetail({Key? key, required this.title, required this.image}) : super(key: key);
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.23,
        decoration:  BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: NetworkImage(image)),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(35),
              bottomLeft: Radius.circular(35)),
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    splashColor: Colors.red, // Splash color
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const SizedBox(
                        width: 34,
                        height: 34,
                        child: Icon(Icons.arrow_left_outlined)),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    splashColor: Colors.red, // Splash color
                    onTap: () {
                      print('sdlhhkf');
                    },
                    child: const SizedBox(
                        width: 34, height: 34, child: Icon(Icons.bookmark)),
                  ),
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: CircleAvatar(
                      radius: 17,
                      backgroundImage: NetworkImage(
                        image,
                      ))),
              const SizedBox(width: 20),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: CircleAvatar(
                      radius: 17,
                      backgroundImage: NetworkImage(
                        image,
                      ))),
              const SizedBox(width: 20),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: CircleAvatar(
                      radius: 17,
                      backgroundImage: AssetImage(
                        Utils.returnImageCategory(image),
                      )))
            ])
          ],
        ));
  }
}
