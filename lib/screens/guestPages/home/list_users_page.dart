import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages//home/person_tile.dart';
import 'package:provider/provider.dart';

import '../../../Models/Person.dart';

QuerySnapshot? snapshot;

class ListUser extends StatelessWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final persons = Provider.of<List<Person?>?>(context);
    // persons?.forEach((person) {
    //   print(person?.age);
    //   print(person?.last_name);
    // });
    return ListView.builder(
        itemCount: persons?.length,
        itemBuilder: (context, index) {
          return PersonTile(person: persons![index]);
        });
  }
}
