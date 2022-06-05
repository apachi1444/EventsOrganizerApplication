import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/Models/Guest.dart';

import '../Models/Service.dart';
import '../sharedPreferences/GuestPreferences.dart';

class GuestService {
  final String? guestUid;

  GuestService({required this.guestUid});

  final guestsCollection = FirebaseFirestore.instance.collection('guests');

  String? getUidGuest() {
    return guestUid;
  }

  Future addEventToGuestList(
      String title, String description) async {
    return await guestsCollection
        .doc(guestUid)
        .collection('services')
        .add({'title': title, 'description': description});
  }

  Stream<List<Service?>> getAllEventsOfOurGuest() {
    return guestsCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => (Service.fromJson(doc.data()))).toList());
  }

  Future deleteEvent(String uid) async {
    guestsCollection.doc(guestUid).collection('events').doc(uid).delete();
  }

  Future updateGuestData(String name, String localisation) async {
    print(guestUid);
    GuestPreferences.addingGuestDataToSharedPreferences(
        localisation, name, guestUid!);
    print('this is the uid of the guest ');
    print(GuestPreferences.getUid());
    // is gonna refer to that document with that id if not exists he will create that user with these infos
    return await guestsCollection
        .doc(guestUid)
        .set({'name': name, 'localisation': localisation});
  }


  Guest _guestFromSnapshot(DocumentSnapshot documentSnapshot) {
    final doc = documentSnapshot.data() as Map<String, dynamic>;
    print(doc);
    return Guest(
      name: doc['name'],
      localisation: doc['localisation'],
    );
  }

  Future<Guest> readOneGuest() async {
    // the document snapshot will return only one value
    // but the async snapshot will get you a list of results
    return guestsCollection.doc(guestUid).get().then(
            (documentSnapshot) => _guestFromSnapshot(documentSnapshot));
  }

}
