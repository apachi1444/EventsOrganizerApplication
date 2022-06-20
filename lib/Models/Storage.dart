import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile(
      String filePath, String fileName, String currentProfessionalId) async {
    File file = File(filePath);
    try {
      await storage
          .ref('images/professionals/$currentProfessionalId/$fileName')
          .putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<ListResult> listFiles(String? currentProfessional) async {
    ListResult results = await storage
        .ref('images/professionals/$currentProfessional)')
        .listAll();
    for (var ref in results.items) {
      print('found file ' '$ref');
    }
    return results;
  }

  Future<String> downloadFile(
      String professionalId, String imageName, File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('images/professionals/$professionalId/$imageName');

    UploadTask uploadTask = ref.putFile(image);

    var downloadUrl = await (await uploadTask).ref.getDownloadURL();
    return downloadUrl;
  }
}
