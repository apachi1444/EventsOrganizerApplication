import 'package:flutter/material.dart';

class forgot_pswd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 228, 228),
        body: SafeArea(
          child: Center(
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                //icone
                Icon(
                  Icons.android,
                  size: 100,
                ),
                //space between text and top
                SizedBox(height: 75),

                //hello text1
                Text("Hello To My App",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),

                //space between text1 and text 2
                SizedBox(height: 25),

                //text2
                Text("welcome back, you ve been missed! ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                    )),

                SizedBox(height: 50),
                //name filed
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextField(
                                decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nom Complet',
                            ))))),

                SizedBox(height: 8),

                //password filed
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Mot de passe',
                                ))))),

                SizedBox(height: 8),
                //buttom sign in
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 220, 33, 130),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      )),
                    )),

                SizedBox(height: 25),
                //not a member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member ?'),
                    Text(
                      'Regiter Now',
                      style:
                          TextStyle(color: Color.fromARGB(255, 220, 33, 130)),
                    ),
                  ],
                ),
              ])),
        ));
  }
}
