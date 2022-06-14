import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pfs/extensions/constants.dart';
import 'package:pfs/screens/guestPages/events/budget/BudgetPage.dart';
import 'package:pfs/screens/guestPages/events/chickList/MyChickList.dart';
import 'package:pfs/screens/guestPages/events/chickList/addEvenet.dart';
import 'package:pfs/screens/guestPages/events/event/todoList_page.dart';
import 'package:pfs/screens/guestPages/events/guest/guestPage.dart';
import 'package:pfs/sharedPreferences/GuestPreferences.dart';

import '../../../../services/authService.dart';
import '../../../../services/guestService.dart';
import '../../../professionalPages/home_page_test_animation.dart';
import '../../../professionalPages/parametersPages/services/servicesPageParts/noDataFound.dart';
import '../../../professionalPages/parametersPages/settings/settings_page.dart';
import '../../home/home_page_guest.dart';
import 'listOfEventsOfGuest.dart';

class MyEvent extends StatelessWidget {
  const MyEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('My Events'),
        ),
        backgroundColor: const Color(ConstantColors.KPinkColor),
      ),
      body: const Event(),
    );
  }
}

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => EventState();
}

String? uid = AuthService().getCurrentIdUser();

class EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   child: Container(
    //     decoration: const BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(50),
    //       topRight: Radius.circular(50),
    //     )),
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //           child: Container(
    //               padding:
    //                   const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
    //               decoration: const BoxDecoration(
    //                   color: Color.fromARGB(255, 252, 252, 252),
    //                   borderRadius: BorderRadius.only(
    //                       bottomLeft: Radius.circular(20),
    //                       bottomRight: Radius.circular(20),
    //                       topLeft: Radius.circular(20),
    //                       topRight: Radius.circular(20))),
    //               child: Column(
    //                 children: <Widget>[
    //                   const SizedBox(height: 15),
    //                   TextButton(
    //                     style: TextButton.styleFrom(
    //                         primary: const Color.fromARGB(255, 0, 0, 0)),
    //                     onPressed: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                             builder: (context) => const MyCheckingList(),
    //                           ));
    //                     },
    //                     child: CheckingCard('my event', Icons.event),
    //                   ),
    //                   TextButton(
    //                     style: TextButton.styleFrom(
    //                         primary: const Color.fromARGB(255, 0, 0, 0)),
    //                     onPressed: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                             builder: (context) => const MyCheckingList(),
    //                           ));
    //                     },
    //                     child: CheckingCard('my event', Icons.event),
    //                   ),
    //
    //
    //                   FloatingActionButton(
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(20),
    //                       ),
    //                       backgroundColor:
    //                           const Color.fromARGB(255, 241, 11, 88),
    //                       child: const Icon(Icons.add),
    //                       onPressed: () {
    //                         _showTheAddingEventAlertModel(context);
    //                       })
    //                 ],
    //               )),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Column(
      children: [
        const ListOfEventsOfGuest(),
        const SizedBox(height : 15),
        FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color.fromARGB(255, 241, 11, 88),
            child: const Icon(Icons.add),
            onPressed: () {
              _showTheAddingEventAlertModel(context);
            }),
        const SizedBox(height : 15)
      ],
    );
  }
// SwitchSettingsTile
}

void _showTheAddingEventAlertModel(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext bc) {
        return AddEvent(uid: uid);
      });
}

Padding CheckingCard(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    child: Center(
      child: Container(
        //width: 120,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(ConstantColors.KPinkColor),
          ),
          color: const Color.fromARGB(255, 248, 244, 244),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              size: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
