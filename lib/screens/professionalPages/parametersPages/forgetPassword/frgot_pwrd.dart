import 'package:flutter/material.dart';

class forgot_pswd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 228, 228),
        body: SafeArea(
          child: Center(
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                //icone
                const Icon(
                  Icons.android,
                  size: 100,
                ),
                //space between text and top
                const SizedBox(height: 75),

                //hello text1
                const Text("Hello To My App",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),

                //space between text1 and text 2
                const SizedBox(height: 25),

                //text2
                const Text("welcome back, you ve been missed! ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                    )),

                const SizedBox(height: 50),
                //name filed
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: TextField(
                                decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nom Complet',
                            ))))),

                const SizedBox(height: 8),

                //password filed
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Mot de passe',
                                ))))),

                const SizedBox(height: 8),
                //buttom sign in
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 220, 33, 130),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      )),
                    )),

                const SizedBox(height: 25),
                //not a member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
