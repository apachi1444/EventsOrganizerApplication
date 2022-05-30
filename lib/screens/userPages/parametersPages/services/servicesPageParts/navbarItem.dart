import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/extensions/constant_colors.dart';

class NavBarItem extends StatelessWidget {
  final String name;
  final String lastName;
  const NavBarItem({Key? key, required this.name, required this.lastName})
      : super(key: key);

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
            children: [
              const Text('Hello', style: TextStyle(fontSize: 14)),
              Text(
                '$lastName $name',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
