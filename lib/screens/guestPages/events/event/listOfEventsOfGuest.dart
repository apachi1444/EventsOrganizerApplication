import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/events/event/boxOfParticularEvent.dart';
import 'package:pfs/screens/guestPages/searchPage/boxOfProfessionalService.dart';
import 'package:pfs/services/authService.dart';

import '../../../../services/guestService.dart';
import '../../../professionalPages/parametersPages/services/servicesPageParts/noDataFound.dart';
import 'noDataFoundForEvents.dart';

class ListOfEventsOfGuest extends StatelessWidget {
  const ListOfEventsOfGuest({Key? key}) : super(key: key);

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
            allDocs.map((e) => print(e));
            if (snapshot.data.docs.length == 0) {
              return const NoDataFoundForEvents();
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var ourLastElement = allDocs[index].data();
                      String title = ourLastElement['title'];
                      String dateTime = ourLastElement['dateTime'];
                      String uid = ourLastElement['uid'];
                      print(ourLastElement);
                      return BoxOfParticularEvent(
                        index: index + 1,
                        title: title,
                        dateTime: dateTime,
                        eventUid: uid,
                      );
                    }),
              );
            }
          }
        });
    ;
  }
}
