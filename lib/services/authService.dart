import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfs/services/professionalDbService.dart';
import 'package:pfs/sharedPreferences/ProfessionalPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Professional.dart';
import '../Models/Userr.dart';
import '../sharedPreferences/GuestPreferences.dart';
import 'guestService.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final String? _userUid;

  Userr? _useFromFirebaseUser(User user) {
    return user != null ? Userr(uid: user.uid) : null;
  }

  String? getCurrentIdUser() {
    return _auth.currentUser!.uid;
  }

  // Userr ? it might be null
  Future<Userr?> getCurrentUser() async {
    final user = _auth.currentUser!;
    return _useFromFirebaseUser(user);
  }

  Stream<Userr?> get() {
    print(_auth.authStateChanges());
    return _auth.authStateChanges().map((user) => _useFromFirebaseUser(user!));
  }

  Future signOut() async {
    try {
      var aa = await SharedPreferences.getInstance();
      aa.clear();
      return await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    Professional? currentProfessional;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;

    _userUid = user?.uid;

    Userr? userr = _useFromFirebaseUser(user!);
    var professional =
        ProfessionalDatabaseService(uid: user.uid).readOneProfessional();

    professional.then((currentProfessional) {
      String firstName = currentProfessional.first_name;
      String lastName = currentProfessional.last_name;
      String localisation = currentProfessional.localisation;
      int age = currentProfessional.age;

      ProfessionalPreferences.addingProfessionalDataToSharedPreferences(
          email, age, firstName, lastName, localisation, user.uid);
    });

    return userr;
  }

  Future signInAnon(String localisation, String name) async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      GuestPreferences.addingGuestDataToSharedPreferences(
          localisation, name, user?.uid);

      print('lskdf ${GuestPreferences.getUid()}');

      GuestService(guestUid: user?.uid).updateGuestData(name, localisation);
      return _useFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUp(String email, String password, String firstName,
      String lastName, String age, String localisation) async {
    // create user
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = result.user;
      // create a new document for the user with that uid
      await ProfessionalDatabaseService(uid: user!.uid).updateProfessionalData(
          email, firstName, lastName, localisation, age);
      return _useFromFirebaseUser(user);
      // ignore: empty_catches
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
