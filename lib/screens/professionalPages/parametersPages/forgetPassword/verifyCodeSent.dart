// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../extensions/constants.dart';
import 'change_paswd.dart';

class verifyCodeSent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Enter The Code'),
          ),
          backgroundColor: const Color(ConstantColors.KPinkColor),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //circle container
                        Container(
                            width: 200,
                            height: 200,
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Icon(
                                    Icons.mark_email_read,
                                    size: 130,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                )
                              ],
                            )),
                        SizedBox(height: 25),
                        // Confirm  number text
                        Text(
                          'Confirm Number',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),

                        SizedBox(height: 30),

                        // number fieleds
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(children: [
                              //container 1
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset:
                                              Offset(4, 8), // Shadow position
                                        ),
                                      ]),
                                  child: Center(
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          counterText: '',
                                        )),
                                  )),
                              //container 2
                              SizedBox(width: 20),
                              Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset:
                                          Offset(4, 8), // Shadow position
                                        ),
                                      ]),
                                  child: Center(
                                    child: TextField(
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          counterText: '',
                                        )),
                                  )),
                              //container3
                              SizedBox(width: 20),
                              Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset:
                                          Offset(4, 8), // Shadow position
                                        ),
                                      ]),
                                  child: Center(
                                    child: TextField(
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          counterText: '',
                                        )),
                                  )),

                              //container 4
                              SizedBox(width: 20),
                              Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset:
                                          Offset(4, 8), // Shadow position
                                        ),
                                      ]),
                                  child: Center(
                                    child: TextField(
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          counterText: '',
                                        )),
                                  ))                              ])),
                        SizedBox(height: 15),

                        //Ressend the code buttun

                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Resend The Code ?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 237, 12, 121),
                                fontSize: 19),
                          ),
                        ),

                        //send buttuns
                        SizedBox(height: 70),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 44.0),
                                  child: Row(children: [
                                    Icon(Icons.verified, color: Colors.white),
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
                                              builder: (context) =>
                                                  ChangeNewPassword()),
                                        );
                                      },
                                      child: Text(
                                        'Verify',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ]))),
                        ),
                      ],
                    ))
              ]))),
        ));
  }
}
