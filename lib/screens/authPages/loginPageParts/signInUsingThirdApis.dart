import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInUsingThirdApis extends StatelessWidget {
  const SignInUsingThirdApis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: <Widget>[
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: const Divider(
                color: Colors.black,
                height: 50,
              )),
        ),
        const Text('OR'),
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 30.0),
              child: const Divider(
                color: Colors.black,
                height: 36,
              )),
        ),
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/googleIcon.png'),
            radius: 15,
            backgroundColor: Color(0xFFC7D0D8),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: AssetImage('assets/facebookIcon.png'),
            radius: 15,
            backgroundColor: Color(0xFFC7D0D8),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: AssetImage('assets/instagramIcon.png'),
            radius: 15,
            backgroundColor: Color(0xFFC7D0D8),
          ),
        ],
      ),
    ]);
  }
}
