import 'dart:core';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/Models/Guest.dart';
import 'package:pfs/services/professionalDbService.dart';

import '../Models/Event.dart';
import '../Models/Professional.dart';
import '../Models/Service.dart';
import '../sharedPreferences/GuestPreferences.dart';

class GuestService {
  final String? guestUid;
  final bool isDone = false;

  final professionalCollection =
      FirebaseFirestore.instance.collection('professionals');
  final serviceCollection = FirebaseFirestore.instance.collection('services');
  final eventsCollection = FirebaseFirestore.instance.collection('events');

  GuestService({
    this.guestUid,
    bool isDone = false,
  });

  final guestsCollection = FirebaseFirestore.instance.collection('guests');
  final guestsCollectionOfEvents =
      FirebaseFirestore.instance.collection('guestsList');

  String? getUidGuest() {
    return guestUid;
  }

  Future addEventToGuestList(String title, String dateTime) async {
    final aa = guestsCollection.doc(guestUid).collection('events');
    print(aa.path);
    guestsCollection.doc(guestUid).collection('events').add({
      'title': title,
      'dateTime': dateTime,
      'uid': DateTime.now().toString()
      // here i did the then method to get the uid of the current doc
    }).then((element) => guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(element.id)
        .update({'uid': element.id}));
  }

  Stream getStreamOfEventsOfParticularGuest() {
    return guestsCollection.doc(guestUid).collection('events').snapshots();
  }

  Future deleteEvent(String uid) async {
    guestsCollection.doc(guestUid).collection('events').doc(uid).delete();
  }

  Future updateGuestData(String name, String localisation) async {
    print(guestUid);
    GuestPreferences.addingGuestDataToSharedPreferences(
        localisation, name, guestUid);

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

  Future<Guest> getGuestFromDocumentSnapshot() {
    return guestsCollection.doc(guestUid).get().then(_guestFromSnapshot);
  }

  List<Service> _listServicesFromQuerySnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      return Service.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Stream<List<Service>> listProfessionalsWithSameCity(String city) {
    return professionalCollection
        .where('localisation', isEqualTo: city)
        .snapshots()
        .map(_listServicesFromQuerySnapshot);
  }

  var response = [
    {
      'idProfessional': [
        {
          'idService': {
            'title': 'title',
            'description': 'description',
            'type': 'type'
          }
        },
        {
          'idService': {
            'title': 'title',
            'description': 'description',
            'type': 'type'
          }
        }
      ]
    },
    {
      'idProfessional': {
        'idService': {
          'title': 'title',
          'description': 'description',
          'type': 'type'
        }
      }
    },
  ];

  Stream<List<Service>> getAllServicesOfParticularProfessional(String uid) {
    return professionalCollection
        .doc(uid)
        .collection('services')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => (Service.fromJson(doc.data())))
            .toList());
  }

  Stream<List<Service>>
      getServicesOfParticularProfessionalWithParticularCategory(
          String uid, String category) {
    return professionalCollection
        .doc(uid)
        .collection('services')
        .where('title', isEqualTo: category)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => (Service.fromJson(doc.data())))
            .toList());
  }

  Stream<List<Professional>> getAllProfessionalsInOutDb() {
    return professionalCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => (Professional.fromJson(doc.data())))
        .toList());
  }
}
