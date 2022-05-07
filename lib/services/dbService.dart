import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DatabaseService {

    final String uid;
    DatabaseService( this.uid);

    final CollectionReference ourCollection =  FirebaseFirestore.instance.collection("users");

    Future updateUserData(String sugars , String name , int strength )async{
        // is gonna refer to that document with that id if not exists he will create that user with these infos
        return await ourCollection.doc(uid).set({
           'sugars' : sugars,
            'name' : name,
            'strength' : strength
        });
    }

    // we need to set up the stream that will listen to the firestore
    // the query snapshot will be the snaphost of the firestore collection at that moment
    Stream<QuerySnapshot> get ourCollectione {
      return ourCollection.snapshots();
    }

}