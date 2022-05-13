import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:pfs/screens/userPages/home/person_tile.dart';
import 'package:provider/provider.dart';

import '../../../Models/Person.dart';

QuerySnapshot? snapshot ;
class ListUser extends StatelessWidget {
  const ListUser({Key? key}) : super(key: key);


  void getData()async{ //use a Async-await function to get the data
    final data =  await FirebaseFirestore.instance.collection("users").get(); //get the data
    snapshot = data;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return SingleChildScrollView(
      child: ListView.builder(
          itemCount : 2,
          itemBuilder: (context , index){
            // return PersonTile(person: ourList[index])
           return Text("yessine");
          }
      ),
    );
  }
}
