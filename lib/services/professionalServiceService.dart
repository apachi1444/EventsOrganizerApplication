import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Service.dart';

class ProfessionalServiceService {
  final String? professionalUid;

  ProfessionalServiceService({required this.professionalUid});

  final serviceCollection = FirebaseFirestore.instance.collection('services');

  final usersCollection = FirebaseFirestore.instance.collection('users');

  Future addServiceToProfessional(
      String title, String description, String price) async {
    return await usersCollection
        .doc(professionalUid)
        .collection('services')
        .add({'title': title, 'description': description, 'price': price});
  }

  Stream<List<Service?>> getAllServicesOfProfessional() {
    print("\n hahahahhaha");
    print("\n");
    return usersCollection
        .doc(professionalUid)
        .collection('services')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => (Service.fromJson(doc.data())))
            .toList());
  }

  Future deleteService(String uid) async {
    usersCollection
        .doc(professionalUid)
        .collection('services')
        .doc(uid)
        .delete();
  }

  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;
    await for (final value in stream) {
      print(value);
      sum += value;
    }
    return sum;
  }
}
