import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static String returnImageCategory(String category) {
    switch (category) {
      case 'Traiteur':
        {
          return 'assets/traiteur.jpg';
        }
      case 'Neggafa':
        {
          return 'assets/neggafa.jpg';
        }
      case 'WeddingPlanner':
        {
          return 'assets/fiancee.jpg';
        }
      case 'Dj':
        {
          return 'assets/djPhoto.jpg';
        }
      default:
        return '/assets/googleIcon.png';
    }
  }

}
