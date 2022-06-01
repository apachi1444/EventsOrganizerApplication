import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/Models/Professional.dart';

class ProfessionalDatabaseService {
  final String uid;

  ProfessionalDatabaseService({required this.uid});

  final CollectionReference professionalCollection =
      FirebaseFirestore.instance.collection('professionals');

  Future updateProfessionalData(String email, String firstName, String lastName,
      String age, String localisation) async {
    // is gonna refer to that document with that id if not exists he will create that user with these infos
    return await professionalCollection.doc(uid).set({
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'age': int.parse(age),
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
    print('this is the place of the error');
    final doc = documentSnapshot.data() as Map<String, dynamic>;
    print(doc);
    return Professional(
      email: doc['email'],
      first_name: doc['first_name'],
      last_name: doc['last_name'],
      age: doc['age'],
      localisation: doc['localisation'],
    );
  }

  Future<Professional> readOneProfessional() async {
    // the document snapshot will return only one value
    // but the async snapshot will get you a list of results
    return professionalCollection.doc(uid).get().then(
        (documentSnapshot) => _professionalFromSnapshot(documentSnapshot));
  }

  // we convert the stream into the list of Perons to display them in the home HomePage
  // the getter method should always be without parameters
  Stream<List<Professional?>> get getUsers {
    return professionalCollection
        .snapshots()
        .map(_professionalListFromSnapshot);
  }

  // Stream<Professional> get userData {
  //   return professionalCollection
  //       .doc(uid)
  //       .snapshots()
  //       .map(_professionalListFromSnapshot);
  // }

}
