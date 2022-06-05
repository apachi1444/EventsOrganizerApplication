import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/events/event/addTask.dart';

import '../../../../extensions/constant_colors.dart';
import '../chickList/MyChickList.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  //bool isDone = false; // just for now
  TextEditingController todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('My Todo List'),
        ),
        leading: IconButton(
          onPressed: () {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCheckingList(),
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
      body: SafeArea(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const TaskCard();
          },
        ),
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
                return const AddTask();
              },
            );
          }
          ),
    );
  }
}

class TaskCard extends StatefulWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;
  deleteTask() {}

  editTask() {}

  updateTodo() {}

  completeTask(value) {
      setState(() {
        isChecked = value!;
      });

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: completeTask,
                activeColor: const Color(ConstantColors.KPinkColor),
                checkColor: Colors.white,
              ),
              const Expanded(
                child: ListTile(
                  title: Text('Two-line ListTile'),
                  subtitle: Text('Here is a second line'),
                ),
              ),
              IconButton(
                onPressed: editTask,
                icon: const Icon(Icons.edit_outlined),
              ),
              IconButton(
                onPressed: deleteTask,
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
