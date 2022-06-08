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
    ListResult results = await storage.ref('images/professionals/$currentProfessional)').listAll();
    results.items.forEach((Reference ref) {
      print("found file " + "$ref");
    });
    return results;
  }
Future<String> downloadFile(String professionalId , String imageName) async {
  String downloadUrl = await storage.ref('images/professionals/$professionalId/$imageName').getDownloadURL();
  return downloadUrl;
  }

}