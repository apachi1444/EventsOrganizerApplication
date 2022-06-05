import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pfs/screens/guestPages/guestSwitchMainPage.dart';

import '../../services/authService.dart';

class LogInAsAGuestPage extends StatefulWidget {
  const LogInAsAGuestPage({Key? key}) : super(key: key);

  @override
  State<LogInAsAGuestPage> createState() => _LogInAsAGuestPageState();
}

class _LogInAsAGuestPageState extends State<LogInAsAGuestPage> {
  final _localisationController = TextEditingController();
  final _nameController = TextEditingController();
  final authService = AuthService();

  // the dispose method is called when the object is removed from the
  // tree permanently
  // use case : when the widget is replaced with another widget using the navigator
  // .push Replacement
  @override
  void dispose() {
    super.dispose();
  }

  // this method is called after the initState method
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  // this method is called after the didChangeDependencies
  @override
  void didUpdateWidget(covariant LogInAsAGuestPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  // when the object is removed not permanently from the tree
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  // is called before the build method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFF8),
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70)),
              color: Color(0XFFFF006B),
            ),
            padding: const EdgeInsets.all(25),
            child: SvgPicture.asset(
              'assets/welcome.svg',
              //fit: B,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.height * 0.1,
            ),
          ),

          const SizedBox(height: 30),

          const Text('Enter Your Coordinates',
              style: TextStyle(
                color: Color(0XFF000000),
                fontSize: 30,
              )),

          const SizedBox(height: 20),

          // this part is for the text fields

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0XFFF8F4F4),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          blurRadius: 0.6,
                          spreadRadius: 0.8,
                          offset: const Offset(0, 4))
                    ]),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        controller: _localisationController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type Your Localisation Here',
                          hintStyle: TextStyle(fontSize: 12),
                          prefixIcon: Icon(
                            Icons.map_outlined,
                            size: 22,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ))),
              )),

          const SizedBox(height: 0),

          // this is for the second input field for the user

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0XFFF8F4F4),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          blurRadius: 0.6,
                          spreadRadius: 0.8,
                          offset: const Offset(0, 4))
                    ]),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type Your Name And Last Name Here',
                          hintStyle: TextStyle(fontSize: 12),
                          prefixIcon: Icon(
                            Icons.verified_user,
                            size: 22,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ))),
              )),

          const SizedBox(height: 15),

          // this is for the button of JOIN US
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0XFFFF006B),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: GestureDetector(
                  onTap: () async {
                    // dynamic result = await authService.signInAnon();
                    // if (result == null) {
                    //   print('error ');
                    // } else {
                    //   print('signed in');
                    //   print(result.uid);
                    //   DatabaseService(uid: result.uid).updateGuestData(
                    //       _localisationController.text.trim(),
                    //       _nameController.text.trim());
                    // }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const GuestSwitchMainPage();
                    }));
                  },
                  child: const Center(
                    child: Text('Start The Adventure',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ),
                ),
              )),
        ])),
      ),
    );
  }
}
