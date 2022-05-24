import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages//home/homePageParts/professionalBoxInHomePage.dart';

class ProfessionalSlider extends StatelessWidget {
  const ProfessionalSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: false,
          height: 265),
      items: [
        const ProfessionalBoxInHomePage(),
        const ProfessionalBoxInHomePage(),
        const ProfessionalBoxInHomePage(),

        // this part for trying the chip component
        Chip(
            label: const Text('This is the text inside the chip'),
            avatar: CircleAvatar(child: Image.asset('assets/googleIcon.png')),
            onDeleted: () {
              print('this is the delete part in the chip component');
            }),

        // this part for trying the clipreact part
      ],
    );
  }
}
