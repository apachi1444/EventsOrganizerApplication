import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class GetFileFirebase {
  final String? uidProfessional;

  GetFileFirebase({required this.uidProfessional});

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<firebase_storage.ListResult> listFiles() async {
    String nameCollectionStorage = 'images/professional/$uidProfessional';
    firebase_storage.ListResult result =
        await storage.ref(nameCollectionStorage).listAll();
    return result;
  }

  Future<String> downloadURL(String imageName) async {
    String nameCollectionStorage = 'images/professional/$uidProfessional/$imageName';
    String download = await storage.ref(nameCollectionStorage).getDownloadURL();
    return download;
  }
}
