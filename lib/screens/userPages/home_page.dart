
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";

import '../../read_data/get_user_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;

  // document ID
  List<String> docIds = [];

  // get docIDS
  Future getDocId() async{
     await FirebaseFirestore.instance.collection('users').get().then(
         (snapshot) => snapshot.docs.forEach((document) {
           print(document.reference);
           docIds.add(document.reference.id);
         })
     );

  }

  // @override
  // void initState(){
  //   getDocId();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text(
          user.email!,
          style : TextStyle(fontSize: 16),
        ),
        actions :[
          GestureDetector(
              onTap : (){
                FirebaseAuth.instance.signOut();
                },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal : 12.0),
                child: Icon(Icons.logout),
              )
          )
         ]
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("SignIn as " + user.email!),
            // MaterialButton(
            //   onPressed : (){
            //     FirebaseAuth.instance.signOut();
            //   },
            //   color : Colors.deepPurple[200],
            //   child : Text("Sign Out Now ")
            // ),
            
            Expanded(
              child : FutureBuilder(
                future : getDocId(),
                // once you get the documents ids , do the builder method
                builder:(context , snapshot) {
                  return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: GetUserName(documentId: docIds[index]),
                          tileColor : Colors.deepPurple[200],
                        ),
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
      )
    );
  }
}
