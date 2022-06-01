import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../extensions/constant_colors.dart';

class WholeContainerOfUpdatingDataProfessional extends StatelessWidget {
  const WholeContainerOfUpdatingDataProfessional({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
          height: size.height * 0.22,
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
                  left: size.width * 0.26,
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
                          const Text('Edit Profile',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(ConstantColors.KPinkColor))),
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
    ;
  }
}
