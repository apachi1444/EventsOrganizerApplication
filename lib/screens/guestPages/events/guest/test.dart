import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/screens/guestPages/events/guest/addGuest.dart';
import 'package:pfs/services/todolist_services.dart';
import '../../../../extensions/constants.dart';
import '../chickList/MyChickList.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  //bool isDone = false; // just for now
  //TextEditingController todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> tasksStream =
        FirebaseFirestore.instance.collection('tasks').snapshots();

    bool isChecked = false;

    editTask() {}

    updateTodo() {}

    completeTask(value) {
      setState(() {
        isChecked = value!;
      });
    }

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
        backgroundColor: const Color.fromARGB(255, 255, 0, 107),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: tasksStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
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
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: completeTask,
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(documentSnapshot['title']),
                              subtitle: Text(documentSnapshot['description']),
                            ),
                          ),
                          IconButton(
                            onPressed: editTask,
                            icon: const Icon(Icons.edit_outlined),
                          ),
                          IconButton(
                            onPressed: () =>
                                TodoServices().deleteTask(documentSnapshot.id),
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
                return const AddGuest();
              },
            );
          }),
    );
  }
}
