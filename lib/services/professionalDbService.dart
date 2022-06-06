import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/Models/Professional.dart';

import '../sharedPreferences/ProfessionalPreferences.dart';

class ProfessionalDatabaseService {
  final String? uid;

  ProfessionalDatabaseService({required this.uid});

  final CollectionReference professionalCollection =
      FirebaseFirestore.instance.collection('professionals');

  Future updateProfessionalData(String email, String firstName, String lastName,
      String localisation, String age) async {
    // is gonna refer to that document with that id if not exists he will create that user with these infos
    return await professionalCollection.doc(uid).set({
      'email': email,
      'age': age,
      'first_name': firstName,
      'last_name': lastName,
      'localisation': localisation
    });
  }

  Future changeProfessionalData(
      String firstName, String lastName, String localisation) async {
    ProfessionalPreferences.updatingProfessionalData(
        firstName, lastName, localisation);
    return await professionalCollection.doc(uid).update({
      'first_name': firstName,
      'last_name': lastName,
      'localisation': localisation
    });
  }

  Stream<List<Professional>> readProfessionals() =>
      professionalCollection.snapshots().map((snapshot) => snapshot.docs
          .map((doc) =>
              (Professional.fromJson(doc.data() as Map<String, dynamic>)))
          .toList());

  List<Professional> _professionalListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print('this is element' + doc.toString());
      return Professional.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Professional _professionalFromSnapshot(DocumentSnapshot documentSnapshot) {
    final doc = documentSnapshot.data() as Map<String, dynamic>;
    print(doc);
    return Professional(
      email: doc['email'],
      first_name: doc['first_name'],
      last_name: doc['last_name'],
      age: doc['age'] as int,
      localisation: doc['localisation'],
    );
  }

  Future<Professional> readOneProfessional() async {
    // the document snapshot will return only one value
    // but the async snapshot will get you a list of results
    return professionalCollection.doc(uid).get().then(
        (documentSnapshot) => _professionalFromSnapshot(documentSnapshot));
  }

  Stream<List<Professional?>> get getUsers {
    return professionalCollection
        .snapshots()
        .map(_professionalListFromSnapshot);
  }
}
