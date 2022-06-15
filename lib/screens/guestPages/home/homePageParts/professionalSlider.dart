import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages//home/homePageParts/professionalBoxInHomePage.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/dataNotFound.dart';
import 'package:pfs/services/guestService.dart';

import '../../../../extensions/utils.dart';

class ProfessionalSlider extends StatelessWidget {
  const ProfessionalSlider(
      {Key? key,
      required this.guestUid,
      required this.professionalUid,
      required this.category})
      : super(key: key);
  final String? guestUid;
  final String? professionalUid;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: GuestService(guestUid: guestUid)
            .getAllServicesOfParticularProfessional(professionalUid!),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Text('this is an error');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            print('this is the category choose ' + category!);
            if (snapshot.data.length == 0) {
              return const NoServicesFound();
            } else {
              return CarouselSlider.builder(
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    height: MediaQuery.of(context).size.height * 0.32),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  String description = snapshot.data[index].getDescription();
                  String dateTime = snapshot.data[index].getDateTime();
                  String image = snapshot.data[index].getImage();
                  String price = snapshot.data[index].getPrice();
                  String title = snapshot.data[index].getTitle();
                  print("klsjdf");
                  print(title);
                  if (title == category) {
                    return ProfessionalBoxInHomePage(
                        imageCategory: Utils.returnImageCategory(title),
                        title: title,
                        image: image,
                        description: description,
                        price: price,
                        dateTime: dateTime);
                  }
                  return Container();
                },
              );
            }
          }
        });
  }
}
