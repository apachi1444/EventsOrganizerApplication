import 'package:flutter/material.dart';
import 'package:pfs/services/eventsService.dart';
import 'package:pfs/services/todolist_services.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key, this.eventUid}) : super(key: key);
  final String? eventUid;
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController todoTitleController = TextEditingController();
  TextEditingController todoDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) => AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        title: Row(children: [
          const Text(
            'Add New Task',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.cancel, color: Colors.grey),
          ),
        ]),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            TextFormField(
              controller: todoTitleController,
              style: const TextStyle(
                fontSize: 18,
                //height: 1.5,

                //color: Color.fromARGB(255, 95, 18, 119),
              ),
              decoration: const InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: Color.fromARGB(179, 63, 60, 60),
                ),
                //border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: todoDescriptionController,
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
                //color: Color.fromARGB(255, 216, 81, 81),
              ),
              decoration: const InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Color.fromARGB(179, 63, 60, 60)),
//                border: UnderlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final title = todoTitleController.text;
              final description = todoDescriptionController.text;
              EventsService(eventUid : widget.eventUid).addTaskToEventToDoList(title, description);
              TodoServices().addTask(title: title, description: description);
              print('this is the uid of the event selected');
              print(widget.eventUid);
              Navigator.pop(context, 'add');
              // }
            },
            child: const Center(child: Text('add')),
          ),
        ],
      );
}

// class TaskFormWidget extends StatelessWidget {
//   const TaskFormWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
