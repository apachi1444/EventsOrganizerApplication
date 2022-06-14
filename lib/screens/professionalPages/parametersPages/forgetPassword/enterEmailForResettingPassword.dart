// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pfs/screens/professionalPages/parametersPages/forgetPassword/verify.dart';

import '../../../../extensions/constants.dart';

class EnterEmailForResettingPassword extends StatelessWidget {
  const EnterEmailForResettingPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Forget Password ?'),
        ),
        backgroundColor: const Color(ConstantColors.KPinkColor),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
                child: Column(children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              width: double.infinity,
              height: 640.5,
              // margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  )),
              child: Column(
                children: [
                  //circle container
                  Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(150),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(4, 8),
                            ),
                          ]),
                      child: Column(
                        children: [
                          Icon(
                            Icons.question_mark_rounded,
                            size: 60,
                            color: Color.fromARGB(255, 210, 102, 138),
                          ),
                          Icon(
                            Icons.people,
                            size: 100,
                            color: Color.fromARGB(255, 210, 102, 138),
                          ),
                          Icon(
                            Icons.password,
                            size: 50,
                            color: Color.fromARGB(255, 210, 102, 138),
                          ),
                        ],
                      )),
                  SizedBox(height: 25),
                  // reset pasword text
                  Text(
                    'Reset Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),

                  SizedBox(height: 30),

                  // email text filed
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ]),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 60.0),
                              child: TextField(
                                  decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: 'Enter Your Email',
                              ))))),
                  SizedBox(height: 15),
                  //send buttuns
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                        width: 200,
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 237, 12, 121),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(4, 8),
                            ),
                          ],
                        ),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Row(children: [
                              Icon(Icons.send, color: Colors.white),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => verify()),
                                  );
                                },
                                child: Text(
                                  'Send Email',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ]))),
                  ),
                ],
              ))
        ]))),
      ),
    );
  }
}
