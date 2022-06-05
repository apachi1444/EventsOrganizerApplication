import 'package:flutter/material.dart';
import 'package:pfs/services/todolist_services.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController todoTitleController = TextEditingController();
  TextEditingController todoDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) => AlertDialog(
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
    title: Row(children: [
      const Text(
        'Add New Event',
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
            hintText: "Evnt's name",
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

          TodoServices add = TodoServices();
          add.addTask(title: title, description: description);
          // if (todoTitleController.text.isNotEmpty) {
          //   print(todoTitleController.text);

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
