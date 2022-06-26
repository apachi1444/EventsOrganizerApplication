import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfs/extensions/listOfCategories.dart';
import 'package:pfs/services/eventsService.dart';

import '../../../extensions/constants.dart';
import '../../../services/authService.dart';
import '../../../services/guestService.dart';
import '../events/event/noDataFoundForEvents.dart';

class DialogShowingListEventsAvailable extends StatelessWidget {
  const DialogShowingListEventsAvailable(
      {Key? key,
      required this.title,
      required this.imageCategory,
      required this.professionalLastName,
      required this.professionalFirstName,
      required this.price,
      required this.description})
      : super(key: key);
  final String title;
  final String imageCategory;
  final String professionalLastName;
  final String professionalFirstName;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    String? uid = AuthService().getCurrentIdUser();
    return StreamBuilder(
        stream:
            GuestService(guestUid: uid).getStreamOfEventsOfParticularGuest(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Text('there is no data for the moment in our stream');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text(
                'there is waiting data for the moment in our stream');
          } else {
            var allDocs = snapshot.data.docs;
            if (snapshot.data.docs.length == 0) {
              return const NoDataFoundForEvents();
            } else {
              return AlertDialog(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'All Events',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.cancel, color: Colors.grey),
                  ),
                ]),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ListView.builder(
                    itemCount: allDocs.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Card(
                            color: const Color(ConstantColors.KGreyColor),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                      child: CircleAvatar(
                                        radius: 17,
                                        backgroundImage:
                                            AssetImage('assets/eventImage.jpg'),
                                      ),
                                    ),
                                    // SizedBox(width: size.width * 0.01),
                                    Text(allDocs[index]['title']),
                                    // SizedBox(width: size.width * 0.32),
                                    GestureDetector(
                                        child: const Icon(Icons.add_box_sharp),
                                        onTap: () async {
                                          String uid = allDocs[index]['uid'];
                                          EventsService(eventUid: uid)
                                              .addProfessionalServiceToEvent(
                                                  title,
                                                  imageCategory,
                                                  professionalFirstName,
                                                  professionalLastName,
                                                  price,
                                                  description)
                                              .then((value) {
                                            Fluttertoast.showToast(
                                                msg: 'added Successfully',
                                                backgroundColor: Colors.green,
                                                textColor: Colors.white,
                                                fontSize: 25);
                                            Navigator.pop(context);
                                          }).catchError((onError) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Error In Adding This Professional In Your Lists',
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 25);
                                          });
                                        }),
                                  ]),
                            )),
                      );
                    },
                  ),
                ),
              );
            }
          }
        });
    ;
  }
}
