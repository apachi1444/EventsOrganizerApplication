import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Service.dart';

class ProfessionalServiceService {
  final String? professionalUid;

  ProfessionalServiceService({required this.professionalUid});

  final serviceCollection = 'services';

  final professionalCollection =
      FirebaseFirestore.instance.collection('professionals');

  Future addServiceToProfessional(
      String dateTime, String title, String description, String price) async {
    return await professionalCollection
        .doc(professionalUid)
        .collection('services')
        .add({
      'dateTime': dateTime,
      'title': title,
      'description': description,
      'price': price
    });
  }

  Stream<List<Service?>>? getAllServicesOfProfessional() {
    List<Service>? services;
    professionalCollection
        .doc(professionalUid)
        .collection(serviceCollection)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (int i = 0; i < value.docs.length; i++) {
          print(value.docs[i].data()['title']);
          print(value.docs[i]);
          services
              ?.add(Service.fromJson(value.docs![i] as Map<String, dynamic>));
        }
      }
    });

    var stream = professionalCollection
        .doc(professionalUid)
        .collection(serviceCollection)
        .snapshots();

    var list = stream.map((snapshot) => snapshot.docs.map((doc) {
          print(doc);
          Service.fromJson(doc.data());
        }).toList());
    print(list);
    return list;
  }

  Stream getStreamOfServicesOfParticularProfessional() {
    return professionalCollection
        .doc(professionalUid)
        .collection('services')
        .snapshots();
  }

  Future deleteService(String uid) async {
    professionalCollection
        .doc(professionalUid)
        .collection(serviceCollection)
        .doc(uid)
        .delete();
  }

  // this is just for testing how the stream works in the flutter and dart in general
  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;
    await for (final value in stream) {
      print(value);
      sum += value;
    }
    return sum;
  }

  String? getIdCurrentServiceProfessional(String date) {
    print(professionalCollection
        .doc(professionalUid)
        .collection('services')
        .where('dateTime', isEqualTo: date)
        .get()
        .then((snapshot) => {print(snapshot.docs[0].reference.delete())}));
    return null;
  }
}
