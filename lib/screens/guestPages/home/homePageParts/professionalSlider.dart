import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages//home/homePageParts/professionalBoxInHomePage.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/dataNotFound.dart';
import 'package:pfs/services/guestService.dart';

import '../../../../extensions/utils.dart';

class ProfessionalSlider extends StatelessWidget {
  const ProfessionalSlider(
      {Key? key, required this.guestUid, required this.category})
      : super(key: key);
  final String? guestUid;
  final String? category;

  @override
  Widget build(BuildContext context) {
    final guestService = GuestService(guestUid: guestUid);
    return StreamBuilder(
        stream: guestService.getAllProfessionalsInOutDb(),
        builder: (BuildContext context,
            AsyncSnapshot<dynamic> snapshotProfessional) {
          if (snapshotProfessional.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshotProfessional.data.length == 0) {
              return Container();
            } else {
              String firstName = snapshotProfessional.data[0].getFirstName();
              String lastName = snapshotProfessional.data[0].getLastName();
              String uid = snapshotProfessional.data[0].getUid();
              print(firstName + "sdlkqjflksdjf");
              return StreamBuilder(
                  stream: guestService
                      .getServicesOfParticularProfessionalWithParticularCategory(
                          uid, category!),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('still waiting');
                    } else if (snapshotProfessional.connectionState ==
                        ConnectionState.none) {
                      return const NoServicesFound();
                    }
                    else if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.active) {
                      if(snapshot.data.length ==0) {
                        return const NoServicesFound();
                      }
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            height: MediaQuery.of(context).size.height * 0.30),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          String description =
                              snapshot.data[index].getDescription();
                          String dateTime = snapshot.data[index].getDateTime();
                          String image = snapshot.data[index].getImage();
                          String price = snapshot.data[index].getPrice();
                          String title = snapshot.data[index].getTitle();
                          if (title == category!) {
                            return ProfessionalBoxInHomePage(
                              imageCategory: Utils.returnImageCategory(title),
                              title: title,
                              image: image,
                              description: description,
                              price: price,
                              dateTime: dateTime,
                              firstNameProfessional: firstName,
                              lastNameProfessional: lastName,
                            );
                          }
                          return Container();
                        },
                      );

                      return Container();
                      // return CarouselSlider.builder(
                      //   options: CarouselOptions(
                      //       enlargeCenterPage: true,
                      //       enableInfiniteScroll: false,
                      //       autoPlay: false,
                      //       height:
                      //           MediaQuery.of(context).size.height * 0.30),
                      //   itemCount: snapshot.data.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     String description =
                      //         snapshot.data[index].getDescription();
                      //     String dateTime =
                      //         snapshot.data[index].getDateTime();
                      //     String image = snapshot.data[index].getImage();
                      //     String price = snapshot.data[index].getPrice();
                      //     String title = snapshot.data[index].getTitle();
                      //     if (title == category!) {
                      //       return ProfessionalBoxInHomePage(
                      //         imageCategory: Utils.returnImageCategory(title),
                      //         title: title,
                      //         image: image,
                      //         description: description,
                      //         price: price,
                      //         dateTime: dateTime,
                      //         firstNameProfessional: firstName,
                      //         lastNameProfessional: lastName,
                      //       );
                      //     }
                      //     return Container();
                      //   },
                      // );
                    } else {
                      return const Text('hahahahahah');
                    }
                  });

              // for (final e in snapshotProfessional.data) {
              //   String firstName = e.getFirstName();
              //   String lastName = e.getLastName();
              //   String uid = e.getUid();
              //   print(firstName);
              //   return StreamBuilder(
              //       stream: guestService
              //           .getServicesOfParticularProfessionalWithParticularCategory(
              //               uid, category!),
              //       builder: (BuildContext context,
              //           AsyncSnapshot<dynamic> snapshot) {
              //         if (snapshot.connectionState == ConnectionState.waiting) {
              //           return const Text('still waiting');
              //         } else if (snapshotProfessional.connectionState ==
              //             ConnectionState.none) {
              //           return const NoServicesFound();
              //         } else if (snapshot.hasData &&
              //             snapshot.connectionState == ConnectionState.active) {
              //           for (final e in snapshot.data) {
              //             Widget aa = ProfessionalBoxInHomePage(
              //                 title: e.getTitle(),
              //                 imageCategory:
              //                     Utils.returnImageCategory(e.getTitle()),
              //                 image: e.getImage(),
              //                 dateTime: e.getDateTime(),
              //                 price: e.getPrice(),
              //                 description: e.getDescription(),
              //                 firstNameProfessional: firstName,
              //                 lastNameProfessional: lastName);
              //             print(aa);
              //           }
              //
              //           return CarouselSlider.builder(
              //             options: CarouselOptions(
              //                 enlargeCenterPage: true,
              //                 enableInfiniteScroll: false,
              //                 autoPlay: false,
              //                 height:
              //                     MediaQuery.of(context).size.height * 0.30),
              //             itemCount: snapshot.data.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               String description =
              //                   snapshot.data[index].getDescription();
              //               String dateTime =
              //                   snapshot.data[index].getDateTime();
              //               String image = snapshot.data[index].getImage();
              //               String price = snapshot.data[index].getPrice();
              //               String title = snapshot.data[index].getTitle();
              //               if (title == category!) {
              //                 return ProfessionalBoxInHomePage(
              //                   imageCategory: Utils.returnImageCategory(title),
              //                   title: title,
              //                   image: image,
              //                   description: description,
              //                   price: price,
              //                   dateTime: dateTime,
              //                   firstNameProfessional: firstName,
              //                   lastNameProfessional: lastName,
              //                 );
              //               }
              //               return Container();
              //             },
              //           );
              //         } else {
              //           return const Text('hahahahahah');
              //         }
              //       });
              // }
            }
          }
        });
  }
}
