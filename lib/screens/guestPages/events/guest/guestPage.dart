// import 'package:flutter/material.dart';
// import 'package:pfs/screens/guestPages/events/event/addTask.dart';
// import 'package:pfs/screens/guestPages/events/guest/addGuest.dart';

// import '../../../../extensions/constants.dart';
// import '../chickList/MyChickList.dart';

// class Guest extends StatefulWidget {
//   const Guest({Key? key}) : super(key: key);

//   @override
//   State<Guest> createState() => _GuestState();
// }

// class _GuestState extends State<Guest> {
//   //bool isDone = false; // just for now
//   TextEditingController todoTitleController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text('My Guests'),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             WidgetsBinding.instance?.addPostFrameCallback((_) {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const MyCheckingList(),
//                   ));
//             });
//           },
//           color: Colors.white,
//           icon: const Icon(Icons.arrow_back),
//         ),
//         backgroundColor: const Color(ConstantColors.KPinkColor),
//       ),
//       body: SafeArea(
//         child: ListView.builder(
//           itemCount: 5,
//           itemBuilder: (context, index) {
//             return const TaskCard();
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           backgroundColor: Color.fromARGB(255, 241, 11, 88),
//           child: const Icon(Icons.add),
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return const AddGuest();
//               },
//             );
//           }),
//     );
//   }
// }

// class TaskCard extends StatefulWidget {
//   const TaskCard({Key? key}) : super(key: key);

//   @override
//   State<TaskCard> createState() => _TaskCardState();
// }

// class _TaskCardState extends State<TaskCard> {
//   bool isChecked = false;
//   deleteTask() {}

//   editTask() {}

//   updateTodo() {}

//   completeTask(value) {
//     setState(() {
//       isChecked = value!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         height: 100,
//         child: Card(
//           margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//           child: Row(
//             children: [
//               Checkbox(
//                 value: isChecked,
//                 onChanged: completeTask,
//                 activeColor: const Color(ConstantColors.KPinkColor),
//                 checkColor: Colors.white,
//               ),
//               const Expanded(
//                 child: ListTile(
//                   title: Text('Two-line ListTile'),
//                   subtitle: Text('Here is a second line'),
//                 ),
//               ),
//               IconButton(
//                 onPressed: editTask,
//                 icon: const Icon(Icons.edit_outlined),
//               ),
//               IconButton(
//                 onPressed: deleteTask,
//                 icon: Icon(Icons.delete),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/events/event/addTask.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/screens/guestPages/events/event/todoList_page.dart';
import 'package:pfs/screens/guestPages/events/guest/addGuest.dart';
import 'package:pfs/services/todolist_services.dart';

import '../../../../extensions/constants.dart';
import '../../../../services/eventsService.dart';
import '../../../../services/guestListServices.dart';
import '../../../../services/guestService.dart';
import '../chickList/MyChickList.dart';

class GuestList extends StatefulWidget {
  const GuestList({Key? key, this.eventUid}) : super(key: key);
  final String? eventUid;

  @override
  State<GuestList> createState() => _GuestListState();
}

class _GuestListState extends State<GuestList> {
  //bool isDone = false; // just for now
  //TextEditingController todoTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _eventsService = EventsService(eventUid: widget.eventUid);
    final guestsStream = _eventsService.guestsStream();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('My Guests'),
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
        stream: guestsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];

                return Center(
                  child: SizedBox(
                    height: 100,
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.person_outline_sharp),
                          Expanded(
                            child: ListTile(
                              title: Text(documentSnapshot['title']),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              final uid = documentSnapshot['uid'];
                              _eventsService.deleteSpecificGuestFromEventGuests(uid);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color.fromARGB(255, 241, 11, 88),
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddGuest(eventUid: widget.eventUid);
              },
            );
          }),
    );
  }
}
