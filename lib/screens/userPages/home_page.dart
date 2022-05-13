// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import "package:flutter/material.dart";
// import 'package:pfs/screens/userPages/home/settings_page.dart';
//
// import '../../Models/Person.dart';
// import '../../services/authService.dart';
// import '../../services/dbService.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final user = FirebaseAuth.instance.currentUser!;
//
//   final _auth = AuthService();
//
//   final _service = DatabaseService(uid: '');
//
//   // document ID
//   List<String> docIds = [];
//
//   // get docIDS
//   Future getDocId() async {
//     await FirebaseFirestore.instance
//         .collection('users')
//         .get()
//         .then((snapshot) => snapshot.docs.forEach((document) {
//               print(document.reference);
//               docIds.add(document.reference.id);
//             }));
//   }
//
//   @override
//   void initState(){
//     getDocId();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<QuerySnapshot?<Map<String,dynamic>>>.value(
//       initialData: null,
//       value : getDocId(),
//       child: Scaffold(
//         appBar: AppBar(
//           title : Text(
//             user.email!,
//             style : TextStyle(fontSize: 16),
//           ),
//           actions :[
//             GestureDetector(
//                 onTap : (){
//                   _auth.SignOut();
//                   },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal : 12.0),
//                   child: Icon(Icons.logout),
//                 )
//             )
//            ]
//         ),
//         body:Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Text("SignIn as " + user.email!),
//               // MaterialButton(
//               //   onPressed : (){
//               //     FirebaseAuth.instance.signOut();
//               //   },
//               //   color : Colors.deepPurple[200],
//               //   child : Text("Sign Out Now ")
//               // ),
//
//               ListUser(),
//
//               Expanded(
//                 child : StreamBuilder<List<Person>>(
//                   stream : _service.readPersons(),
//                   // once you get the documents ids , do the builder method
//                   builder:(context , snapshot) {
//                     return ListView.builder(
//                       itemCount: docIds.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListTile(
//                             title: GetUserName(documentId: docIds[index]),
//                             tileColor : Colors.deepPurple[200],
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 ),
//               ),
//             ],
//           ),
//         )
//       ),
//     );
//   }
//
//   // Remark should we make a provider for the
//   // home page because we need to pass the data
//   // to the widgets related to the home page
//   void _showSettingsPanel() {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Container(padding: EdgeInsets.all(8), child: SettingsForm());
//         });
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(title: Text("All Users"), actions: <Widget>[
//   //       MaterialButton(
//   //           child: Text("Show the Settings"),
//   //           onPressed: () => _showSettingsPanel())
//   //     ]),
//   //     // body: ListUser()
//   //     body: StreamBuilder(
//   //         stream: _service.readPersons(),
//   //         builder: (context, snapshot) {
//   //           if (snapshot.hasError) {
//   //             return Column(children: [
//   //               const Text('Something went wrong'),
//   //               MaterialButton(
//   //                   onPressed: () {
//   //                     _auth.SignOut();
//   //                   },
//   //                   color: Colors.deepPurple[200],
//   //                   child: Text("Sign Out Now ")),
//   //             ]);
//   //           } else if (snapshot.hasData) {
//   //             final persons = snapshot.data!;
//   //             return ListView(
//   //               children:
//   //                   persons.map((person) => buildPerson(person!)).toList(),
//   //             );
//   //           } else {
//   //             return const Center(child: CircularProgressIndicator());
//   //           }
//   //         }),
//   //   );
//   // }
//
//   Widget buildPerson(Person person) => ListTile(
//         leading: CircleAvatar(child: Text('${user.email}')),
//         title: Text('${user.email}'),
//       );
// }
//
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:pfs/read_data/get_user_name.dart';

import '../../services/authService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  List<String> docIds = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIds.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    print('yoyo');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            MaterialButton(
                onPressed:  (){
                  AuthService().SignOut();
                }
            ),
            Container(
                child: FutureBuilder(
              future: getDocId(),
              builder: (context, snpashot) {
                return ListView.builder(
                  itemCount: docIds.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetUserName(documentId: docIds[index]),
                    );
                  },
                );
              },
            )),
          ],
        ));
  }
}
