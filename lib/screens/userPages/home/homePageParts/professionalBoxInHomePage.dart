import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfessionalBoxInHomePage extends StatelessWidget {
  const ProfessionalBoxInHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(25)),

        // this is for fixing the flex problem in the our container

        height: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: size.width * 0.05),
                  const Text('Micheal Boston'),
                  SizedBox(width: size.width * 0.195),
                  const Icon(Icons.bookmark),
                  SizedBox(width: size.width * 0.02),
                  const Icon(Icons.call_end_sharp),
                ],
              ),
            ),

            // this is for the image

            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(children: [
                  GestureDetector(
                    onTap: () {Navigator.pushNamed(context, '/profile/professionalDetail');},
                    child: Container(
                        constraints: const BoxConstraints.expand(height: 136),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/facebookIcon.png'),
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 136,
                        child: Stack(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.arrow_circle_right_outlined,
                                    size: 34),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(Icons.arrow_circle_left_outlined,
                                    size: 34),
                              ),
                            )
                          ],
                        )),
                  ),
                ])),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // this is for the date
                    Row(children: const [
                      Icon(Icons.date_range_outlined),
                      SizedBox(width: 6),
                      Text('11 March',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),

                    // this is for the rate
                    Row(children: const [
                      Icon(Icons.star_border_rounded),
                      Icon(Icons.star_border_rounded),
                      Icon(Icons.star_border_rounded),
                      Icon(Icons.star_border_rounded),
                      Icon(Icons.star_border_rounded),
                    ])
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
