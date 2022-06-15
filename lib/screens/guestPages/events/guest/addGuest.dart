import 'package:flutter/material.dart';
import 'package:pfs/services/guestListServices.dart';

import '../../../../services/eventsService.dart';

class AddGuest extends StatefulWidget {
  const AddGuest({Key? key, this.eventUid}) : super(key: key);
  final String? eventUid;
  @override
  State<AddGuest> createState() => _AddGuestState();
}

class _AddGuestState extends State<AddGuest> {
  TextEditingController guestNameController = TextEditingController();
  // TextEditingController todoDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) => AlertDialog(

        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        title: Row(children: [
          const Text(
            'Add you Guest',
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
              controller: guestNameController,
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
//         TextFormField(
//           controller: todoDescriptionController,
//           style: const TextStyle(
//             fontSize: 18,
//             height: 1.5,
//             //color: Color.fromARGB(255, 216, 81, 81),
//           ),
//           decoration: const InputDecoration(
//             hintText: 'Description',
//             hintStyle: TextStyle(color: Color.fromARGB(179, 63, 60, 60)),
// //                border: UnderlineInputBorder(),
//           ),
//           maxLines: 2,
//         ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final name = guestNameController.text;
              const isDone = true;
              EventsService(eventUid: widget.eventUid).addGuestToEventGuestList(name);
              GuestListService().addGuest(name: name, isDone: isDone);

              Navigator.pop(context, 'add');
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
