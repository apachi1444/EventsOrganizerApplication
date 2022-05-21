
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  const GetUserName({required  this.documentId});


  @override
  Widget build(BuildContext context) {
      // get the collection of
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      return FutureBuilder<DocumentSnapshot>(
        future : users.doc(documentId).get(),
        builder: (
          (context , snapshot) {
            if (snapshot.connectionState == ConnectionState.done){
              Map<String , dynamic> data =
                snapshot.data!.data() as Map<String , dynamic>;
              return Text("${data['first_name']}"
              ' '
              "${data['last_name']}");
          }
            return const Text('Loading');
          }
        )
      );
  }
}
