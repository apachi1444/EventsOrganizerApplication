import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/guestSwitchMainPage.dart';

import '../../../../extensions/constants.dart';
import '../../../../services/eventsService.dart';
import 'noDataFoundForEvents.dart';

class ListProfessionalsEventPage extends StatelessWidget {
  const ListProfessionalsEventPage({Key? key, required this.eventUid})
      : super(key: key);
  final String eventUid;

  @override
  Widget build(BuildContext context) {
    final _eventsService = EventsService(eventUid: eventUid);
    final professionalStream = _eventsService.professionalStream();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Professionals'),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(ConstantColors.KPinkColor),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: professionalStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.data?.docs.length == 0) {
                return const NoDataFoundForEvents(content: 'Professionals');
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      var finalImage = documentSnapshot['imageCategory'];
                      var title = documentSnapshot['title'];
                      var price = documentSnapshot['price'];
                      var professionalFirstName =
                          documentSnapshot['professionalFirstName'];
                      var professionalLastName =
                          documentSnapshot['professionalLastName'];
                      var professionalUid = documentSnapshot['uid'];
                      return Container(
                          margin: const EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        finalImage,
                                        fit: BoxFit.cover,
                                      ))),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Colors.black.withOpacity(0.7),
                                              Colors.transparent
                                            ]))),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      ClipOval(
                                          child: Container(
                                              color: Colors.white,
                                              padding: const EdgeInsets.all(10),
                                              child: const Icon(
                                                  Icons.wallet_travel,
                                                  size: 30,
                                                  color: Color(ConstantColors
                                                      .KPinkColor)))),
                                      const SizedBox(width: 15),
                                      Text(
                                          '$professionalFirstName $professionalLastName',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20))
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 15),
                                      Text('$price \$',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22))
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      ClipOval(
                                          child: Container(
                                              color: Colors.white,
                                              padding: const EdgeInsets.all(8),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _eventsService
                                                      .deleteSpecificProfessionalFromEventBudget(
                                                          professionalUid);
                                                },
                                                child: const Icon(
                                                  Icons.restore_from_trash,
                                                  size: 20,
                                                  color: Color(ConstantColors
                                                      .KPinkColor),
                                                ),
                                              )))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ));
                    });
              }
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color.fromARGB(255, 241, 11, 88),
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      const GuestSwitchMainPage(),
                ),
              );
            }),
      ),
    );
  }
}
