import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Service.dart';

class ProfessionalServiceService {
  final String? professionalUid;

  ProfessionalServiceService({required this.professionalUid});

  final serviceCollection = 'services';

  final professionalCollection =
      FirebaseFirestore.instance.collection('professionals');

  Future addServiceToProfessional(
      String dateTime, String title, String description, String price,String image) async {
    return await professionalCollection
        .doc(professionalUid)
        .collection('services')
        .add({
      'image' : image,
      'dateTime': dateTime,
      'title': title,
      'description': description,
      'price': price
    });
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


  // Stream<List<Service>> getAllServicesOfAllProfessionals(){
  //   professionalCollection.snapshots().map(
  //       (professional) => professional.docs.forEach((element) {
  //
  //       })
  //   )
  // }
}
