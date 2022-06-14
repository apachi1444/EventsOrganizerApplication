import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/events/chickList/MyChickList.dart';

import '../../../../extensions/constants.dart';

class BoxOfParticularEvent extends StatelessWidget {
  const BoxOfParticularEvent(
      {Key? key,
      required this.index,
      required this.title,
      required this.dateTime,
      required this.eventUid})
      : super(key: key);
  final int index;
  final String title;
  final String eventUid;

  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(ConstantColors.KPinkColor),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
            tileColor: Colors.white,
            leading: const Image(
              image: AssetImage('assets/eventImage.jpg'),
            ),
            title: Text('Event Number $index',
                style: const TextStyle(fontSize: 13)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                Text(title),
                const SizedBox(height: 6),
                Text(dateTime),
              ],
            ),
            isThreeLine: true,
            trailing: GestureDetector(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: const Color(ConstantColors.KPinkColor),
                  // Background color
                  onPrimary: Colors.white, // Text Color (Foreground color)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyCheckingList(eventUid: eventUid)),
                  );
                },

                icon: const Icon(
                  Icons.remove_red_eye_sharp,
                  size: 15.0,
                ),
                label: const Text('Check Details'), // <-- Text
              ),
            )),
      ),
    );
  }
}
