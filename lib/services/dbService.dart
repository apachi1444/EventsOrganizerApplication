import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Person.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference ourCollection =
      FirebaseFirestore.instance.collection("users");

  Future updateUserData(String first_name, String last_name, String age) async {
    // is gonna refer to that document with that id if not exists he will create that user with these infos
    return await ourCollection.doc(uid).set({
      'first_name': first_name,
      'last_name': last_name,
      'age': int.parse(age),
    });
  }

  // person list from the snapshot

  // we need to set up the stream that will listen to the firestore
  // the query snapshot will be the snaphost of the firestore collection at that moment
  Stream<List<Person?>> readPersons() =>
      // the collection reference
      // so we can access all the documents in the collection
      ourCollection.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => (Person.fromJson(doc.data() as Map<String, dynamic>))
              // Reqmarque if we don't the .toList it's gonna be an iterable
              )
          .toList());

  // Stream<List<Person>> returnIDs() {
  //   return ourCollection
  //       .snapshots()
  //       .map((querySnap) => querySnap.docs //Mapping Stream of CollectionReference to List<QueryDocumentSnapshot>
  //       .map((doc) => doc.data.id) //Getting each document ID from the data property of QueryDocumentSnapshot
  //       .toList());
  // }
  List<Person> _personListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print("this is elemnt" + doc.toString());
      return Person.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  // we convert the stream into the list of Perons to display them in the home HomePage
  // the getter method should always be without parameters
  Stream<List<Person?>> get readAllPersons {
    return ourCollection.snapshots().map(_personListFromSnapshot);
  }
}

// if we want to take only one docuemnt from the
// collection we wull use the reference collection
// .docuemnt(his uid ) and then .get() to take the
// docuemnt snapshot
// then of course thesnapshot.data() to get the json data
