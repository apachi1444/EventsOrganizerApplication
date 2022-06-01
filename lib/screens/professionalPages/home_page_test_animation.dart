// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import "package:flutter/material.dart";
// import 'package:pfs/screens/userPages/home/settings_form.dart';
//
// import '../../Models/Person.dart';
// import '../../services/authService.dart';
// import '../../services/dbService.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final user = FirebaseAuth.instance.currentUser!;
//
//   final _auth = AuthService();
//
//   final _service = DatabaseService(uid: '');
//
//   // document ID
//   List<String> docIds = [];
//
//   // get docIDS
//   Future getDocId() async {
//     await FirebaseFirestore.instance
//         .collection('users')
//         .get()
//         .then((snapshot) => snapshot.docs.forEach((document) {
//               print(document.reference);
//               docIds.add(document.reference.id);
//             }));
//   }
//
//   @override
//   void initState(){
//     getDocId();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<QuerySnapshot?<Map<String,dynamic>>>.value(
//       initialData: null,
//       value : getDocId(),
//       child: Scaffold(
//         appBar: AppBar(
//           title : Text(
//             user.email!,
//             style : TextStyle(fontSize: 16),
//           ),
//           actions :[
//             GestureDetector(
//                 onTap : (){
//                   _auth.SignOut();
//                   },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal : 12.0),
//                   child: Icon(Icons.logout),
//                 )
//             )
//            ]
//         ),
//         body:Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Text("SignIn as " + user.email!),
//               // MaterialButton(
//               //   onPressed : (){
//               //     FirebaseAuth.instance.signOut();
//               //   },
//               //   color : Colors.deepPurple[200],
//               //   child : Text("Sign Out Now ")
//               // ),
//
//               ListUser(),
//
//               Expanded(
//                 child : StreamBuilder<List<Person>>(
//                   stream : _service.readPersons(),
//                   // once you get the documents ids , do the builder method
//                   builder:(context , snapshot) {
//                     return ListView.builder(
//                       itemCount: docIds.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListTile(
//                             title: GetUserName(documentId: docIds[index]),
//                             tileColor : Colors.deepPurple[200],
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 ),
//               ),
//             ],
//           ),
//         )
//       ),
//     );
//   }
//
//   // Remark should we make a provider for the
//   // home page because we need to pass the data
//   // to the widgets related to the home page
//   void _showSettingsPanel() {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Container(padding: EdgeInsets.all(8), child: SettingsForm());
//         });
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(title: Text("All Users"), actions: <Widget>[
//   //       MaterialButton(
//   //           child: Text("Show the Settings"),
//   //           onPressed: () => _showSettingsPanel())
//   //     ]),
//   //     // body: ListUser()
//   //     body: StreamBuilder(
//   //         stream: _service.readPersons(),
//   //         builder: (context, snapshot) {
//   //           if (snapshot.hasError) {
//   //             return Column(children: [
//   //               const Text('Something went wrong'),
//   //               MaterialButton(
//   //                   onPressed: () {
//   //                     _auth.SignOut();
//   //                   },
//   //                   color: Colors.deepPurple[200],
//   //                   child: Text("Sign Out Now ")),
//   //             ]);
//   //           } else if (snapshot.hasData) {
//   //             final persons = snapshot.data!;
//   //             return ListView(
//   //               children:
//   //                   persons.map((person) => buildPerson(person!)).toList(),
//   //             );
//   //           } else {
//   //             return const Center(child: CircularProgressIndicator());
//   //           }
//   //         }),
//   //   );
//   // }
//
//   Widget buildPerson(Person person) => ListTile(
//         leading: CircleAvatar(child: Text('${user.email}')),
//         title: Text('${user.email}'),
//       );
// }
//
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pfs/screens/guestPages//home/settings_form.dart';
import 'package:provider/provider.dart';

import '../../Models/Person.dart';
import '../../services/authService.dart';
import '../../services/dbService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool bookmarked = false;
  final user = FirebaseAuth.instance.currentUser;

  // controller of our animation
  late final AnimationController _controller;

  // this is the animation object
  late Animation<Color?> _colorAnimation;

  // this is an Animation object
  late Animation<double?> _sizeAnimation;

  // this is for the curved Animation
  late Animation<double> _curvedAnimation;

  List<String> docIds = [];

  bool isFav = false;

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIds.add(document.reference.id);
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // a ticket is like a clock and for every tick we get an animation value from point a to b
    // and for the vsync it will sunc the controller with a ticket
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    // we are telling the controller to control the animation color
    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);

    // we are telling the controller to control the size _controller
    _sizeAnimation = TweenSequence<double>(
      // this list will be a type of tween_sequence_item
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 30, end: 50), weight: 50),
        TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 50),
      ],
      // it will take 500 milliseconds to go through the tween sequence
    ).animate(_controller);

    // this is for the curved animation
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _controller.forward();

    // this function will fire every time the controller will emit a new value
    // emitting values from zero to one in that duration
    _controller.addListener(() {
      setState(() {});
      print(_controller.value);
      print(_colorAnimation.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }

      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
      // if animation status is completed or not
      // animation status dismissed if we do in onPressed the controller.reverse()
      print('this is value of the isFAve boolean ' + isFav.toString());
      print(status);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();

    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return const SettingsForm();
          });
    }

    return StreamProvider<List<Person?>?>.value(
      value: DatabaseService(uid: '').getUsers,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          actions: [
            TextButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Log out'),
              onPressed: () {
                _auth.signOut();
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('settings'),
              onPressed: () {
                _showSettingsPanel();
              },
            )
          ],
        ),
        body: Column(
          children: [
            // const ListUser(),
            GestureDetector(
              onTap: () {
                print('this is the bookmarked boolean');
                if (bookmarked == false) {
                  bookmarked = true;
                  _controller.forward();
                } else {
                  bookmarked = false;
                  _controller.forward();
                }
              },
              child: Lottie.network(
                'https://assets6.lottiefiles.com/datafiles/SkdS7QDyJTKTdwA/data.json',
                controller: _controller,
              ),
            ),

            // we can add the curved animation to any animation build widget( animated container, opacity)
            TweenAnimationBuilder(
                child: const Text('this is the title for the curved animation'),
                curve: Curves.bounceIn,
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 3000),
                builder: (context, double _val, child) {
                  return Opacity(
                      opacity: _val,
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: _val * 20),
                          child: child));
                }),
            // the animate builder is something that will surround that element that we want to animate
            // it will listen to changes in our animation controller and rebuild the tree automatically
            AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, _) {
                  return IconButton(
                    icon: Icon(Icons.password,
                        color: _colorAnimation.value,
                        size: _sizeAnimation.value),
                    onPressed: () {
                      isFav ? _controller.reverse() : _controller.forward();
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
