import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Service.dart';

class GuestService {
  final String? guestUid;

  GuestService({required this.guestUid});

  final guestsCollection = FirebaseFirestore.instance.collection('guests');

  String? getUidGuest() {
    return guestUid;
  }

  Future addEventToGuestList(
      String title, String description, String price) async {
    return await guestsCollection
        .doc(guestUid)
        .collection('services')
        .add({'title': title, 'description': description, 'price': price});
  }

  Stream<List<Service?>> getAllEventsOfOurGuest() {
    return guestsCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => (Service.fromJson(doc.data()))).toList());
  }

  Future deleteEvent(String uid) async {
    guestsCollection.doc(guestUid).collection('events').doc(uid).delete();
  }
}
