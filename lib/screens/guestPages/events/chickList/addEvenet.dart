import 'package:flutter/material.dart';
import 'package:pfs/services/guestService.dart';
import 'package:pfs/services/todolist_services.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({Key? key , required this.uid}) : super(key: key);
  final String? uid ;

  @override
  Widget build(BuildContext context) {
    final eventDateController= TextEditingController();
    final eventTitleController = TextEditingController();
    return
      AlertDialog(
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
              controller: eventTitleController,
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
              controller: eventDateController,
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
                //color: Color.fromARGB(255, 216, 81, 81),
              ),
              decoration: const InputDecoration(
                hintText: 'Date Time',
                hintStyle: TextStyle(color: Color.fromARGB(179, 63, 60, 60)),
//                border: UnderlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final title = eventTitleController.text;
              final dateTime = eventDateController.text;

              GuestService(guestUid: uid).addEventToGuestList(title, dateTime);
              Navigator.pop(context);
            },
            child: const Center(child: Text('add')),
          ),
        ],
      );
  }

}


