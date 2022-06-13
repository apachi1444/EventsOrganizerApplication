// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'change_paswd.dart';

class verify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
                  child: Column(children: [
            //forgot text
            Padding(
              padding: EdgeInsets.only(left: 90),
              child: Text(
                "Forgot Password",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 25),
            //first container
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
                      "Confirm Number",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),

                    SizedBox(height: 30),

                    // number fieleds
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(children: [
                          //container 1
                          Container(
                              width: 60,
                              padding: EdgeInsets.symmetric(horizontal: 25),
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
                              child: TextField(
                                  decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '8',
                              ))),
                          //container 2
                          SizedBox(width: 20),
                          Container(
                              width: 60,
                              padding: EdgeInsets.symmetric(horizontal: 25),
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
                              child: TextField(
                                  decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '8',
                              ))),
                          //container3
                          SizedBox(width: 20),
                          Container(
                              width: 60,
                              padding: EdgeInsets.symmetric(horizontal: 25),
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
                              child: TextField(
                                  decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '8',
                              ))),

                          //container 4
                          SizedBox(width: 20),
                          Container(
                              width: 60,
                              padding: EdgeInsets.symmetric(horizontal: 25),
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
                              child: TextField(
                                  decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '8',
                              )))
                        ])),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 44.0),
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
                                          builder: (context) => change_pswd()),
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
