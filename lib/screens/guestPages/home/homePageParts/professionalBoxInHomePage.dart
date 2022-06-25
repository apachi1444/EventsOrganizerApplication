import 'package:flutter/material.dart';
import 'package:pfs/extensions/constants.dart';
import 'package:pfs/screens/guestPages/common/dialogShowingListEventsAvailable.dart';
import 'package:pfs/screens/guestPages/professional/professionalDetail.dart';

class ProfessionalBoxInHomePage extends StatelessWidget {
  const ProfessionalBoxInHomePage(
      {Key? key,
      required this.title,
      required this.imageCategory,
      required this.image,
      required this.dateTime,
      required this.price,
      required this.description,
      required this.firstNameProfessional,
      required this.lastNameProfessional})
      : super(key: key);
  final String title;
  final String imageCategory;
  final String image;
  final String dateTime;
  final String price;
  final String description;
  final String firstNameProfessional;
  final String lastNameProfessional;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(ConstantColors.KPinkColor),
            ),
            borderRadius: BorderRadius.circular(20)),

        // this is for fixing the flex problem in the our container

        height: size.width * 0.5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: CircleAvatar(
                      radius: 17,
                      backgroundImage: AssetImage("assets/avatar.jpg"),
                    ),
                  ),
                  // SizedBox(width: size.width * 0.01),
                  Text('$firstNameProfessional $lastNameProfessional'),
                  // SizedBox(width: size.width * 0.32),
                  GestureDetector(
                      child: const Icon(Icons.bookmark),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const DialogShowingListEventsAvailable();
                          },
                        );
                      }),
                ],
              ),
            ),

            // this is for the image

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfessionalDetail(
                                    title: title,
                                    description: description,
                                    price: price,
                                    image: image,
                                    dateTime: dateTime)));
                      },
                      child: Container(
                          constraints: const BoxConstraints.expand(height: 136),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(image),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: size.width * 0.3,
                          child: Stack(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 9.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_circle_right_outlined,
                                      size: 34, color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(Icons.arrow_circle_left_outlined,
                                      size: 34, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ),
                  ])),
            ),

            // this is for the bottom part of the sized box

            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // this is for the date
                    Row(children: [
                      const Icon(Icons.date_range_outlined),
                      const SizedBox(width: 6),
                      Text(dateTime,
                          style: const TextStyle(fontWeight: FontWeight.bold))
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
