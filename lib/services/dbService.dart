// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../Models/Person.dart';
// import '../Models/Userr.dart';
//
// class DatabaseService {
//   final String uid;
//
//   DatabaseService({required this.uid});
//
//   final CollectionReference ourCollection =
//       FirebaseFirestore.instance.collection('users');
//
//   final CollectionReference guestCollection =
//       FirebaseFirestore.instance.collection('guests');
//
//   Future updateUserData(String email, String firstName, String lastName,
//       String age, String localisation) async {
//     // is gonna refer to that document with that id if not exists he will create that user with these infos
//     return await ourCollection.doc(uid).set({
//       'email': email,
//       'first_name': firstName,
//       'last_name': lastName,
//       'age': int.parse(age),
//       'localisation': localisation
//     });
//   }
//
//   Future updateGuestData(String wholeName, String localisation) async {
//     return await guestCollection
//         .doc(uid)
//         .set({'wholeName': wholeName, 'localisation': localisation});
//   }
//
//   // person list from the snapshot
//
//   // we need to set up the stream that will listen to the firestore
//   // the query snapshot will be the snaphost of the firestore collection at that moment
//   Stream<List<Person?>> readPersons() =>
//       // the collection reference
//       // so we can access all the documents in the collection
//       ourCollection.snapshots().map((snapshot) => snapshot.docs
//           .map((doc) => (Person.fromJson(doc.data() as Map<String, dynamic>))
//               // Reqmarque if we don't the .toList it's gonna be an iterable
//               )
//           .toList());
//
//   // Stream<List<Person>> returnIDs() {
//   //   return ourCollection
//   //       .snapshots()
//   //       .map((querySnap) => querySnap.docs //Mapping Stream of CollectionReference to List<QueryDocumentSnapshot>
//   //       .map((doc) => doc.data.id) //Getting each document ID from the data property of QueryDocumentSnapshot
//   //       .toList());
//   // }
//   List<Person> _personListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.docs.map((doc) {
//       print('this is elemnt' + doc.toString());
//       return Person.fromJson(doc.data() as Map<String, dynamic>);
//     }).toList();
//   }
//
//   // we convert the stream into the list of Perons to display them in the home HomePage
//   // the getter method should always be without parameters
//   Stream<List<Person?>> get getUsers {
//     return ourCollection.snapshots().map(_personListFromSnapshot);
//   }
//
//   Stream<UserData> get userData {
//     return ourCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
//   }
//
//   Future<UserData> get getUserData async {
//     return ourCollection
//         .doc(uid)
//         .get()
//         .then((value) => _userDataFromSnapshot(value));
//   }
//
//   UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//     final doc = snapshot as Map<String, dynamic>;
//     return UserData(
//       uid: uid,
//       first_name: doc['first_name'],
//       last_name: doc['last_name'],
//       age: doc['age'],
//       localisation: doc['localisation'],
//     );
//   }
//
//   bool exists = false;
// }
//
// // if we want to take only one docuemnt from the
// // collection we wull use the reference collection
// // .docuemnt(his uid ) and then .get() to take the
// // docuemnt snapshot
// // then of course thesnapshot.data() to get the json data
