import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Models/Userr.dart';
import 'dbService.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Userr? _useFromFirebaseUser(User user){
    return user !=null ? Userr(uid: user.uid) : null;
  }

  // Userr ? it might be null
  Future<Userr?> getCurrentUser() async {
    final user = _auth.currentUser;
    return _useFromFirebaseUser(user!);

  }

  Stream<Userr?> get() {
    print(_auth.authStateChanges());
    return _auth.authStateChanges().map((user) => _useFromFirebaseUser(user!));
  }

    // StreamSubscription<User> listen(
    //     void Function(User event) onData,
    //     {
    //       required Function onError,
    //       required void Function() onDone,
    //       required bool cancelOnError
    //     }
    //     )
    //     {
    //         print(onData);
    //         throw UnimplementedError();
    //     }

    Future SignOut() async {
      try {
        return await _auth.signOut();
      } on FirebaseAuthException catch(e){

        print(e.toString());
        return null;
      }
    }






    Future signInWithEmailAndPassword(String email , String password) async {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _useFromFirebaseUser(user!);
    }


    Future signInAnon() async {
      try{
        UserCredential result  = await _auth.signInAnonymously();
        User? user = result.user;
        return _useFromFirebaseUser(user!);
      }
      catch(e){
        print(e.toString());
        return null;
      }
    }


    Future signIn(String emailController , String passwordController) async {
      try{
        print("ahah");
        await _auth.signInWithEmailAndPassword(
          email : emailController,
          password : passwordController,
        );
      } on FirebaseAuthException catch(e){
        print(e);
      }
    }

    Future signUp(String email , String password , String  first_name , String last_name, String age ) async {
      // create user
      try{
        UserCredential result =await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password
        );

        User? user = result.user;
        // create a new document for the user with that uid
        await DatabaseService(uid:user!.uid).updateUserData(first_name, last_name,age);
        return _useFromFirebaseUser(user);
        // ignore: empty_catches
      }catch(e){
        print(e.toString());
        return null;
      }
      // add user details
      // addUserDetails(
      //   _firstNameController.text.trim(),
      //   _lastNameController.text.trim(),
      //   _emailController.text.trim(),
      //   int.parse(_ageController.text.trim()),
      // );
    }
  }


