import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/authService.dart';

class HomePageProfessional extends StatelessWidget {
  const HomePageProfessional({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome Home User '),
              ElevatedButton(
                  onPressed:(){
                    AuthService().signOut();
                    Navigator.pushNamedAndRemoveUntil(context, '/authProfessional', (r) => false);
                  },
                  child: const Text('Log Out Here')
              )
            ],
          )
        ),
      ),
    );
  }
}
