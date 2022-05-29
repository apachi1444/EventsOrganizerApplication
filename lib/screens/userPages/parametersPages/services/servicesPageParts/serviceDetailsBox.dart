import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceDetailsBox extends StatelessWidget {
  const ServiceDetailsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(25)),

        // this is for fixing the flex problem in the our container

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Dj Category'),
                  Row(children: const [
                    Icon(Icons.delete_forever),
                    Icon(Icons.update_disabled),
                  ]),
                ],
              ),

              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundImage: AssetImage('assets/googleIcon.png'),
                    ),
                  ),
                  SizedBox(width: 7),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundImage: AssetImage('assets/googleIcon.png'),
                    ),
                  ),
                  SizedBox(width: 7),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundImage: AssetImage('assets/googleIcon.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Text('A little description here'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text('Price : 200'),
                ],
              ),

              const SizedBox(height: 9),
              // this is for the bottom part of the sized box

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // this is for the date
                  Row(children: const [
                    Icon(Icons.date_range_outlined),
                    SizedBox(width: 4),
                    Text('11 March',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
