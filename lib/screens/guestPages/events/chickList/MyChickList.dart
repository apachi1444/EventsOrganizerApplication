import 'package:flutter/material.dart';
import 'package:pfs/extensions/constants.dart';
import 'package:pfs/screens/guestPages/events/budget/BudgetPage.dart';
import 'package:pfs/screens/guestPages/events/event/list_professionals_event_page.dart';
import 'package:pfs/screens/guestPages/events/event/todoList_page.dart';
import 'package:pfs/screens/guestPages/events/guest/guestPage.dart';

import '../../../../services/eventsService.dart';

class MyCheckingList extends StatelessWidget {
  const MyCheckingList({Key? key, required this.eventUid}) : super(key: key);
  final String eventUid;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('My Event'),
          ),
          backgroundColor: const Color(ConstantColors.KPinkColor),
        ),
        body: MyCheckList(eventUid: eventUid),
      ),
    );
  }
}

class MyCheckList extends StatefulWidget {
  const MyCheckList({Key? key, required this.eventUid}) : super(key: key);
  final String eventUid;

  @override
  State<MyCheckList> createState() => MyCheckListState();
}

class MyCheckListState extends State<MyCheckList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EventsService(eventUid: widget.eventUid)
          .getLengthOfAllElementsInEvent(),
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        return Center(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),

            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10),
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      primary: const Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GuestList(eventUid: widget.eventUid),
                        ));
                  },
                  child: CheckingCard('Guest', Icons.person_add_alt),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: const Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TodoList(eventUid: widget.eventUid),
                        ));
                  },
                  child: CheckingCard('To Do List', Icons.article),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: const Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ListProfessionalsEventPage(eventUid: widget.eventUid),
                        ));
                  },
                  child: CheckingCard('Professionals', Icons.wallet_travel),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: const Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BudgetPage(eventUid: widget.eventUid),
                        ));
                  },
                  child: CheckingCard('Budget', Icons.monetization_on_outlined),
                ),
              ],
            ),

            // child: Column(
            //   children: [
            //     //GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10),
            //
            //     // MainCard("My check List"),
            //     //
            //     // MainCard("My Plannning"),
            //     Padding(
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //       child: Container(
            //         padding:
            //             const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
            //         decoration: const BoxDecoration(
            //           //  color: Color.fromARGB(255, 158, 70, 70),
            //             borderRadius: BorderRadius.only(
            //                 bottomLeft: Radius.circular(20),
            //                 bottomRight: Radius.circular(20),
            //                 topLeft: Radius.circular(20),
            //                 topRight: Radius.circular(20))),
            //         child: Container(
            //           child: Center(
            //             child: Column(
            //               children: [
            //                 const Text('My check List',
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.bold, fontSize: 20)),
            //                 const SizedBox(height: 15),
            //                 Center(
            //                   child: Row(
            //                     children: [
            //                       TextButton(
            //                         style: TextButton.styleFrom(
            //                             primary:
            //                                 const Color.fromARGB(255, 0, 0, 0)),
            //                         onPressed: () {
            //                           WidgetsBinding.instance
            //                               ?.addPostFrameCallback((_) {
            //                             Navigator.pushReplacement(
            //                                 context,
            //                                 MaterialPageRoute(
            //                                   builder: (context) =>
            //                                       const GuestList(),
            //                                 ));
            //                           });
            //                         },
            //                         child: CheckingCard(
            //                             'Guest', Icons.person_add_alt),
            //                       ),
            //                       TextButton(
            //                         style: TextButton.styleFrom(
            //                             primary:
            //                                 const Color.fromARGB(255, 0, 0, 0)),
            //                         onPressed: () {
            //                           WidgetsBinding.instance
            //                               ?.addPostFrameCallback((_) {
            //                             Navigator.pushReplacement(
            //                                 context,
            //                                 MaterialPageRoute(
            //                                   builder: (context) =>
            //                                       const TodoList(),
            //                                 ));
            //                           });
            //                         },
            //                         child:
            //                             CheckingCard('To Do List', Icons.article),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 Row(
            //                   children: [
            //                     CheckingCard(
            //                         'Proffitionnel', Icons.wallet_travel),
            //                     TextButton(
            //                       style: TextButton.styleFrom(
            //                           primary:
            //                               const Color.fromARGB(255, 0, 0, 0)),
            //                       onPressed: () {
            //                         WidgetsBinding.instance
            //                             ?.addPostFrameCallback((_) {
            //                           Navigator.pushReplacement(
            //                               context,
            //                               MaterialPageRoute(
            //                                 builder: (context) =>
            //                                     const BudgetPage(),
            //                               ));
            //                         });
            //                       },
            //                       child:
            //                           CheckingCard('Budget', Icons.monetization_on_outlined),
            //                     ),
            //                   ],
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            //
            // child: Container(
            //    child : const Text("My checklist asmae ",style: TextStyle(fontSize: 18),),
            //
            //
            //
            //   decoration: BoxDecoration(
            //
            //     border: Border.all(
            //         color: const Color(0xFF000000),
            //         width: 2.0,
            //         style: BorderStyle.values.first,), //Border.all
            //     /* The BorderRadius widget  is here */
            //     borderRadius: const BorderRadius.all(
            //       Radius.circular(20),
            //     ), //BorderRadius.all
            //   ), //BoxDecoration
            // ),
          ),
        );
      },
    );
  }
// SwitchSettingsTile
}

Padding checkingCard(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
    child: Center(
      child: Container(
        width: 160,
        height: 160,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 248, 244, 244),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              offset: Offset(
                1,
                1,
              ),
            ),
          ],
        ),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Icon(
              icon,
              size: 50,
            ), //text=Icons.account_balance
            Align(
              alignment: Alignment.center,
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: const Text('0/100'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Padding MainCard(String title) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//     child: Container(
//       padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
//       decoration: const BoxDecoration(
//           color: Color.fromARGB(255, 252, 252, 252),
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(20),
//               bottomRight: Radius.circular(20),
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20))),
//       child: Column(
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//           const SizedBox(height: 15),
//           Row(
//             children: [
//               CheckingCard('Guist', Icons.person_add_alt),
//               CheckingCard('To Do List', Icons.monetization_on_outlined),
//               CheckingCard('Proffitionnel', Icons.wallet_travel),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
