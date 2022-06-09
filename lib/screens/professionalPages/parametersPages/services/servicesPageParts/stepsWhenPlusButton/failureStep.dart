import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../extensions/constants.dart';

class FailureStep extends StatelessWidget {
  const FailureStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Lottie.network(
              "https://assets10.lottiefiles.com/packages/lf20_kjvmebo5.json"),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: FlatButton(
              color: const Color(ConstantColors.KPinkColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Icon(Icons.stop_screen_share_outlined,
                      color: Colors.white),
                  const SizedBox(width: 5),
                  Text(
                    "Try Again".toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
