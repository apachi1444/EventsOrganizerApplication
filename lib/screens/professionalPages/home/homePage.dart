import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/authService.dart';
import '../../../sharedPreferences/ProfessionalPreferences.dart';

class HomePageProfessional extends StatelessWidget {
  const HomePageProfessional({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? firstName = ProfessionalPreferences.getFirstName();
    final String? lastName = ProfessionalPreferences.getLastName();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text('Welcome Home $firstName $lastName'),
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
