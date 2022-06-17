import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsService {
  final CollectionReference professionalCollection =
      FirebaseFirestore.instance.collection('professionals');

  final String? professionalUid;

  SettingsService({required this.professionalUid});

  Future settingOnOrOff(String text, bool isChecked) async {
    switch (text) {
      case 'Show Profile To Others':
        professionalCollection
            .doc(professionalUid)
            .update({'showProfile': isChecked ? true : false});
        break;
      case 'Allow Recommendations':
        professionalCollection
            .doc(professionalUid)
            .update({'allowRecommendation': isChecked ? true : false});
        break;
      case 'Allow Comments':
        professionalCollection
            .doc(professionalUid)
            .update({'allowComments': isChecked ? true : false});
        break;
    }
  }

  Stream<DocumentSnapshot> readOneProfessional() {
    // the document snapshot will return only one value
    // but the async snapshot will get you a list of results
    return professionalCollection.doc(professionalUid).snapshots();
  }
}
