import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../extensions/constants.dart';

class DesscriptionBoxProfessionalDetail extends StatelessWidget {
  const DesscriptionBoxProfessionalDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.22,
          decoration: BoxDecoration(
              color: const Color(ConstantColors.KGreyColor),
              borderRadius: BorderRadius.circular(35)),
          child: Stack(
              // we used this clipBehavior for making the widgets inside the
              // stack widget can be overflowed
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -25,
                  left: MediaQuery.of(context).size.width * 0.26,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                const Color(ConstantColors.KPinkColor),
                            child: CircleAvatar(
                                radius: 22,
                                child: Image.asset('assets/googleIcon.png')),
                          ),
                          const SizedBox(height: 7),
                          const Text('Micheal Boston',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      )),
                ),

                // this is used for the position of the professionalDetail

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 19.0, vertical: 68),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: const [
                        Icon(
                          Icons.search_off_outlined,
                          color: Color(ConstantColors.KPinkColor),
                        ),
                        SizedBox(width: 10),
                        Text('Marrakech , Morocco')
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 17),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.supervised_user_circle_sharp),
                          Text('Member since 11/11/2021'),
                        ]),
                  ),
                )
              ])),
    );
  }
}
