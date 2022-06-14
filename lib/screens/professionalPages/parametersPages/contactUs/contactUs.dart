// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfs/screens/professionalPages/professionalSwitchMainPage.dart';

import '../../../../extensions/constants.dart';
import '../profilePage.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _responseController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('ContactUs'),
          ),
          backgroundColor: const Color(ConstantColors.KPinkColor),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
                  child: Column(children: [
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
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.25,
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
                                Icons.contact_phone_sharp,
                                size: 130,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            )
                          ],
                        )),
                    SizedBox(height: 25),
                    // change psswd text
                    Text(
                      'Contact Us',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),

                    SizedBox(height: 30),
                    //new password filed
                    SizedBox(height: 15),
                    //confirm password fieled
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
                                padding: const EdgeInsets.only(left: 30.0),
                                child: TextField(
                                    minLines: 2,
                                    maxLines: 5,
                                    controller: _responseController,
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.message_sharp,
                                        color: Colors.black,
                                      ),
                                      hintText:
                                          'Type What You Want ! We are Pleased to help you !',
                                    ))))),

                    SizedBox(height: 50),
                    //save buttuns
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
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
                                  const EdgeInsets.symmetric(horizontal: 22.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.save, color: Colors.white),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 255, 255, 255),
                                        ),
                                      ),
                                      onPressed: () {
                                        String response =
                                            _responseController.text.trim();
                                        if (response == '') {
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Check Your Response before sending Please !',
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 25);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: 'Sent successfully',
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 25);
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ProfessionalSwitchMainPage(),
                                            ),
                                            (route) => false,
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Send Your Response',
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
