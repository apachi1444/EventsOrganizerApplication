import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pfs/extensions/constants.dart';
import 'package:pfs/screens/guestPages/events/budget/BudgetPage.dart';
import 'package:pfs/screens/guestPages/events/chickList/addEvenet.dart';
import 'package:pfs/screens/guestPages/events/event/event.dart';
import 'package:pfs/screens/guestPages/events/event/todoList_page.dart';
import 'package:pfs/screens/guestPages/events/guest/guestPage.dart';
import 'package:pfs/sharedPreferences/GuestPreferences.dart';

import '../../../professionalPages/parametersPages/settings/settings_page.dart';

class MyCheckingList extends StatelessWidget {
  const MyCheckingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCheckList(),
    );
  }
}

class MyCheckList extends StatefulWidget {
  const MyCheckList({Key? key}) : super(key: key);

  @override
  State<MyCheckList> createState() => MyCheckListState();
}

class MyCheckListState extends State<MyCheckList> {
  @override
  Widget build(BuildContext context) {
    String? uid = GuestPreferences.getUid();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('My Checking List'),
        ),

        leading: IconButton(
          onPressed: () {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Event(),
                  ));
            });
          },
          color: Colors.black,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),



        backgroundColor: const Color.fromARGB(255, 255, 0, 107),
      ),
      // backgroundColor: Color.fromARGB(255, 198, 127, 121),

      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/250?image=9'),
              ),
              //color: Color.fromARGB(255, 19, 203, 32),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              )),

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
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // WidgetsBinding.instance?.addPostFrameCallback((_) {
          //   Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const AddEvent(),
          //       ));
          // });
          _showTheAddingEventAlertModel(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Event'),
        backgroundColor: const Color(ConstantColors.KPinkColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
// SwitchSettingsTile
}

void _showTheAddingEventAlertModel(BuildContext context) {
  String? uid = GuestPreferences.getUid();

  showDialog(
      context: context,
      builder: (BuildContext bc) {
        print("this is the uid of the guest ");
        print(uid);
        return AddEvent(uid: uid);
      });
}

Padding CheckingCard(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Center(
      child: Container(
        width: 100,
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
        //child: GestureDetector(
        //   onTap:
        //   () {
        //     // { Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => const BudgetPage(), )) ;};
        //   },
        //

        child: Column(
          //mainAxisSize: MainAxisSize.min,

          children: [
            const SizedBox(height: 15),
            Icon(
              icon,
              size: 40,
            ), //text=Icons.account_balance
            Align(
              alignment: Alignment.topRight,
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(fontSize: 13),
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

Padding MainCard(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 252, 252, 252),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Column(
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 15),
          Row(
            children: [
              CheckingCard('Guist', Icons.person_add_alt),
              CheckingCard('To Do List', Icons.monetization_on_outlined),
              CheckingCard('Proffitionnel', Icons.wallet_travel),
            ],
          ),
        ],
      ),
    ),
  );
}
