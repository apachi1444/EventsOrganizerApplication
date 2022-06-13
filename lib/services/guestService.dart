import 'dart:core';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/Models/Guest.dart';
import 'package:pfs/services/professionalDbService.dart';

import '../Models/Professional.dart';
import '../Models/Service.dart';
import '../sharedPreferences/GuestPreferences.dart';

class GuestService {
  final String? guestUid;

  final professionalCollection =
      FirebaseFirestore.instance.collection('professionals');
  final serviceCollection = FirebaseFirestore.instance.collection('services');

  GuestService({required this.guestUid});

  final guestsCollection = FirebaseFirestore.instance.collection('guests');

  String? getUidGuest() {
    return guestUid;
  }

  Future addEventToGuestList(String title, String description) async {
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
    return professionalCollection.doc(uid).collection('services').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => (Service.fromJson(doc.data()))).toList());
  }

  Stream<List<Professional>> getAllProfessionalsInOutDb() {
    return professionalCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => (Professional.fromJson(doc.data())))
        .toList());
  }

  List<Service> searchByCityAndCategory(String city, String category) {
    return [];
  }
  Future<void> deleteTask(String taskId) async {
    await guestsCollection.doc(taskId).delete();
  }

}

// Future<Guest> readOneGuest() async {
//   // the document snapshot will return only one value
//   // but the async snapshot will get you a list of results
//   return guestsCollection
//       .doc(guestUid)
//       .get()
//       .then((documentSnapshot) => _guestFromSnapshot(documentSnapshot));
// }

// Future<<List<Professional>> listProfessionalsWithSameCity(
//     String localisation) async  {
//   // var aa = professionalCollection
//   //     .where('localisation', isEqualTo: localisation)
//   //     .snapshots()
//   //     .map((snapshot) => snapshot.docs
//   //         .map((professional) => Professional.fromJson(professional.data()))
//   //         .toList());
//   // print('trying to print the length of the list of all professionals');
//   // QuerySnapshot querySnapshot = await professionalCollection
//   //     .where('localisation', isEqualTo: localisation).get();
//   //
//   // var b = querySnapshot.docs.forEach((element) {
//   //   element.data();
//   //   print(element.data());
//   // });
//   //
//   // return b;
// }
