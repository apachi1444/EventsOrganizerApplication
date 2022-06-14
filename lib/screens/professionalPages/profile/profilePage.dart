// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pfs/screens/professionalPages/parametersPages/editProfile/edit_profile_page.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPage.dart';
import 'package:pfs/screens/professionalPages/parametersPages/settings/settings_page.dart';

import '../parametersPages/forgetPassword/change_paswd.dart';
import '../parametersPages/forgetPassword/test.dart';

///////////////////////////////////////////////////:Mes  6 CASEs//////////////////////////////////////:
//////ma case 1
// class maCase1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 110,
//         height: 110,
//         decoration: BoxDecoration(
//             color: Color.fromARGB(255, 253, 244, 250),
//             border: Border.all(color: Colors.white),
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Color.fromARGB(255, 195, 194, 194),
//                 blurRadius: 4,
//                 offset: Offset(4, 8), // Shadow position
//               ),
//             ]),
//         child: Column(
//           children: [
//             Icon(
//               Icons.recommend,
//               color: Colors.black,
//               size: 50,
//             ),
//             TextButton(
//               style: ButtonStyle(
//                 foregroundColor: MaterialStateProperty.all<Color>(
//                   Color.fromARGB(255, 255, 255, 255),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => change_pswd()),
//                 );
//               },
//               child: Text(
//                 'recommandation',
//                 style: TextStyle(color: Colors.black, fontSize: 12),
//               ),
//             ),
//           ],
//         ));
//   }
// }

////////////case2
class maCase2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 244, 250),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 195, 194, 194),
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit,
              color: Colors.black,
              size: 50,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfileProfessionalPage()),
                );
              },
              child: Text(
                'Edit Profil',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ],
        ));
  }
}

//////////case3
class maCase3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 244, 250),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 195, 194, 194),
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.settings,
              color: Colors.black,
              size: 50,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Setting()),
                );
              },
              child: Text(
                'Settings',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ],
        ));
  }
}

//////////MA case4
class maCase4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 244, 250),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 195, 194, 194),
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.design_services,
              color: Colors.black,
              size: 50,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesPage()),
                );
              },
              child: Text(
                'My Service',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ],
        ));
  }
}

/////////////////////::ma case 5
class maCase5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 244, 250),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 195, 194, 194),
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              color: Colors.black,
              size: 50,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => test()),
                );
              },
              child: Row(
                children: [
                  Center(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

///////////////::::::my case 6
class maCase6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 244, 250),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 195, 194, 194),
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ]),
        child: Column(
          children: [
            Icon(
              Icons.logout,
              color: Colors.black,
              size: 50,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => change_pswd()),
                );
              },
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ],
        ));
  }
}

//////////////////////////////////////////////myrow///////////////////
class myRow1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [maCase2(), SizedBox(width: 15), maCase3()],
    ));
  }
}

///////////////////////////:my row2 of mes cases

class myRow2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 15),
        maCase4(),
        SizedBox(width: 15),
        maCase5(),
        SizedBox(width: 15),
        // maCase6()
      ],
    ));
  }
}

/////////////////////////////////////////////////////////my main class/////////////////////////////////////////////::
class contact_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
                  child: Column(
            children: [
              //photo container
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                width: double.infinity,
                height: 200.5,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 244, 250),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    )),
              ),

              SizedBox(height: 30),
              //nAME OF THE CLIENT

              Text(
                "Micheal Boston",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 237, 12, 121),
                ),
              ),
              SizedBox(height: 5),
              // @TEXT
              Text(
                "@username",
                style: TextStyle(fontSize: 20),
              ),

              SizedBox(height: 8),

              // text descriptif

              Text(
                "A little Description headd , delete or modify",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 237, 12, 121),
                ),
                textAlign: TextAlign.center,
              ),
              //blocks
              SizedBox(height: 20),

              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Column(
                      children: [myRow1(), SizedBox(height: 15), myRow2()]),
                ),
              ),

              // text descriptif
              SizedBox(height: 27),
              Text(
                "Have Any Problem ?",
                style: TextStyle(fontSize: 20),
              ),

              //send buttuns
              SizedBox(height: 10),
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
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(children: [
                          Icon(Icons.warning, color: Colors.white),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
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
                              'Contact Us',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ]))),
              ),
            ],
          ))),
        ));
  }
}
