import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/extensions/constant_colors.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          const CircleAvatar(
              backgroundColor: Color(ConstantColors.KPinkColor),
              radius: 27,
              child: CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/googleIcon.png'),
              )),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Hello', style: TextStyle(fontSize: 14)),
              Text(
                'Micheal Boston',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
