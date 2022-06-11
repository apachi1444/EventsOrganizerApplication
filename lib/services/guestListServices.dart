import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/Models/GuestList.dart';
import 'package:pfs/Models/Task.dart';

class GuestListService {
  final CollectionReference guests =
      FirebaseFirestore.instance.collection('guestsList');

  Future addGuest({required String name, required bool isDone}) async {
    final guestslistCollection = guests.doc();

    final guest = GuestList(
      id: guestslistCollection.id,
      name: name,
      isDone: isDone,
    );

    final json = guest.toJson();
    await guestslistCollection.set(json);
  }

  Future<void> deleteGuest(String guestId) async {
    await guests.doc(guestId).delete();
  }

  Stream<List<GuestList>> readguests() {
    return FirebaseFirestore.instance.collection('guestsList').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => (GuestList.fromJson(doc.data())))
            .toList());
  }
}
