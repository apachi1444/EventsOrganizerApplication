import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color : Colors.brown[200],
        child:Center(
        child : SpinKitChasingDots(
          color : Colors.brown[200],
          size : 50 ,
        )
      )
    );
  }
}
