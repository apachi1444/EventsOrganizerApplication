import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../Models/Userr.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Userr? _useFromFirebaseUser(User user){
    return user !=null ? Userr(uid: user.uid) : null;
  }


  StreamSubscription<User> listen(
      void Function(User event) onData,
      {
        required Function onError,
        required void Function() onDone,
        required bool cancelOnError
      }
      )
      {
          print(onData);
          throw UnimplementedError();
      }





  
  Future signInAnon() async {
    try{
      UserCredential result  = await _auth.signInAnonymously();
      User? user = result.user;
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