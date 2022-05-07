import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

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

  Stream<Userr?> get()=> _auth!.authStateChanges().map((user) => _useFromFirebaseUser(user!));

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
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email , String password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password) ;
    User? user = result.user;

    // create a new document for the user with that uid
    await DatabaseService(user!.uid).updateUserData("sugars", "ame", 1);

    return _useFromFirebaseUser(user);
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
  
  
  Future signIn(emailController , passwordController) async {
    await _auth.signInWithEmailAndPassword(
      email : emailController.text.trim(),
      password : passwordController.text.trim(),
    );
  }
}