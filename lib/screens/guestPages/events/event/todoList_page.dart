import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/events/event/addTask.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/services/todolist_services.dart';
import '../../../../extensions/constants.dart';
import '../../../../services/eventsService.dart';
import '../chickList/MyChickList.dart';
import 'noDataFoundForEvents.dart';

class TodoList extends StatefulWidget {
  final String? eventUid;

  const TodoList({Key? key, required this.eventUid}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  //bool isDone = false; // just for now
  //TextEditingController todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _eventsService = EventsService(eventUid: widget.eventUid);
    print(widget.eventUid);
    final tasksStream = _eventsService.tasksStream();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('My Todo List'),
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
        stream: tasksStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.data?.docs.length != 0) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                    bool isChecked = documentSnapshot['isDone'];
                    String taskUid = documentSnapshot['uid'];
                    return Center(
                      child: SizedBox(
                        height: 100,
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isChecked = newValue!;
                                    _eventsService.finishedOrNotTask(
                                        taskUid, newValue);
                                  });
                                },
                                activeColor: const Color(ConstantColors.KPinkColor),
                                checkColor: Colors.white,
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(documentSnapshot['title']),
                                  subtitle: Text(documentSnapshot['description']),
                                ),
                              ),
                              // IconButton(
                              //   onPressed: editTask,
                              //   icon: const Icon(Icons.edit_outlined),
                              // ),
                              IconButton(
                                onPressed: () =>
                                    _eventsService.deleteSpecificTaskFromEventTasks(
                                        documentSnapshot['uid']),
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });

            } else {
              return const NoDataFoundForEvents(content: 'ToDoTasks',);
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
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddTask(eventUid: widget.eventUid);
              },
            );
          }),
    );
  }
}

// class TaskCard extends StatefulWidget {
//   const TaskCard({Key? key}) : super(key: key);

//   @override
//   State<TaskCard> createState() => _TaskCardState();
// }

// class _TaskCardState extends State<TaskCard> {
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
