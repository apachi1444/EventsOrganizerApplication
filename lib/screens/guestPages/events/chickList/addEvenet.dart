import 'package:flutter/material.dart';
import 'package:pfs/services/guestService.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key, required this.uid}) : super(key: key);
  final String? uid;

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  DateTime? dateTime;

  final eventDateController = TextEditingController();
  final eventTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
              hintText: "Event's name",
              hintStyle: TextStyle(
                color: Color.fromARGB(179, 63, 60, 60),
              ),
              //border: UnderlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
//             TextFormField(
//               controller: eventDateController,
//               style: const TextStyle(
//                 fontSize: 18,
//                 height: 1.5,
//                 //color: Color.fromARGB(255, 216, 81, 81),
//               ),
//               decoration: const InputDecoration(
//                 hintText: 'Date Time',
//                 hintStyle: TextStyle(color: Color.fromARGB(179, 63, 60, 60)),
// //                border: UnderlineInputBorder(),
//               ),
//             ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2222))
                        .then((value) {
                      setState(() {
                        dateTime = value;
                        eventDateController.text = value.toString();
                      });
                    });
                  },
                  icon: const Icon(Icons.date_range)),
              Text(dateTime == null
                  ? 'Nothing Picked Yet'
                  : DateFormat('yMd').format(dateTime!)),
            ],
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            final title = eventTitleController.text;
            var finalDate = DateFormat('yMd').format(dateTime!);
            GuestService(guestUid: widget.uid)
                .addEventToGuestList(title, finalDate);
            Navigator.pop(context);
          },
          child: const Center(child: Text('add')),
        ),
      ],
    );
  }
}
