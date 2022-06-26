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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('My Events'),
          ),
          backgroundColor: const Color(ConstantColors.KPinkColor),
        ),
        body: const Event(),
      ),
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
    return Column(
      children: [
        const ListOfEventsOfGuest(),
        const SizedBox(height: 15),
        FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color.fromARGB(255, 241, 11, 88),
            child: const Icon(Icons.add),
            onPressed: () {
              _showTheAddingEventAlertModel(context);
            }),
        const SizedBox(height: 15)
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

Padding checkingCard(String title, IconData icon) {
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
