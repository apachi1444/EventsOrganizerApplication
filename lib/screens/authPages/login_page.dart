// import 'package:flutter/material.dart';
// import "package:firebase_auth/firebase_auth.dart";
// import "package:firebase_core/firebase_core.dart";
//
// import '../userPages/forgetPass_page.dart';
// class LoginPage extends StatefulWidget {
//   final VoidCallback showRegisterPage ;
//
//   const LoginPage({Key? key , required this.showRegisterPage}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   Future signIn() async {
//     print('haha');
//     print(_emailController.text.trim());
//     print(_passwordController.text.trim());
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email : _emailController.text.trim() ,
//       password : _passwordController.text.trim(),
//     );
//   }
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor : Colors.grey[300],
//       body : SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//                 mainAxisAlignment : MainAxisAlignment.center,
//
//                 children : [
//                   Icon(
//                     Icons.phone_android,
//                     size : 80
//                   ),
//                   SizedBox(height :30),
//                   Text(
//                       "Hellow Again Dear User",
//                   ),
//                   SizedBox(height : 10),
//                   Text(
//                       "You've Been Missed \"Bro ",
//                       style : TextStyle(
//                         fontSize : 18,
//                       )
//                   ),
//
//                   SizedBox(height :60),
//                   // this part for the email inputs
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal : 20),
//                     child: Container(
//                       decoration : BoxDecoration(
//                         color : Colors.white ,
//                         border :Border.all(color : Colors.white),
//                         borderRadius : BorderRadius.circular(14),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left : 20),
//                         child: TextField(
//                           controller : _emailController,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText : "Email"
//                           )
//                         ),
//                       ),
//                     ),
//                   ),
//
//
//                   // this part now for the password inputs
//
//                   SizedBox(height :10),
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal : 20),
//                     child: Container(
//                       decoration : BoxDecoration(
//                         color : Colors.white ,
//                         border :Border.all(color : Colors.white),
//                         borderRadius : BorderRadius.circular(14),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left : 20),
//                         child: TextField(
//                             controller : _passwordController,
//                             obscureText : true ,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText : "Password",
//                           )
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height : 10),
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Row(
//                       mainAxisAlignment :  MainAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap : (){
//                             Navigator.push(context , MaterialPageRoute(builder:
//                             (context){
//                               return ForgetPassPage();
//                             }
//                             )
//                             );
//                           },
//                           child: const Text("Forget Password?",
//                             style : TextStyle(
//                               color : Colors.blue,
//                               fontWeight : FontWeight.bold,
//                             )
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height : 10),
//                   // Sign In Button
//                   Padding(
//                     padding  : const EdgeInsets.symmetric(horizontal : 20),
//                     child : GestureDetector(
//                       onTap : signIn,
//                       child: Container(
//                         padding : EdgeInsets.all(25),
//                         decoration : BoxDecoration(
//                             color:Colors.deepPurple,
//                             borderRadius : BorderRadius.circular(20)
//                         ),
//                         child : Center(
//                           child : Text(
//                             "Sign In",
//                             style : TextStyle(
//                                 color : Colors.white,
//                                 fontWeight : FontWeight.bold,
//                             )
//                           )
//                         )
//                       ),
//                     )
//                   ),
//
//                   const SizedBox(height : 20),
//
//
//                   const SizedBox(height : 20),
//
//                   // not a member sign up here because
//
//                   Row(
//                     mainAxisAlignment:  MainAxisAlignment.center,
//                     children : [
//                       Text("Don't Have An Account ! " , style :TextStyle(
//                           fontWeight : FontWeight.bold,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap : widget.showRegisterPage,
//                         child: Text("  Register Here !" , style :TextStyle(
//                           color : Colors.blue,
//                           fontWeight : FontWeight.bold,
//                         ),
//                         ),
//                       )
//                     ]
//                   )
//
//
//                 ]
//             ),
//           ),
//         ),
//       )
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pfs/extensions/utils.dart';
import 'package:pfs/services/authService.dart';

import '../../extensions/constant_colors.dart';
import '../../main.dart';
import '../../shared/loading_screen_page.dart';
import '../welcomePages/navbarItemsStartedPages/navbarItemStartPages.dart';
import 'inputTextWidget.dart';
import 'loginPageParts/signInUsingThirdApis.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;

  const LoginPage({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  String error = '';
  final _auth = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;
    return loading
        ? const LoadingScreen()
        : Scaffold(
            backgroundColor: const Color(0XFFFFFFF8),
            body: SingleChildScrollView(
              child: Center(
                  child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  const NavBarItemStartPages(),

                  const SizedBox(height: 30),

                  const Text('Welcome Abroad User',
                      style: TextStyle(
                        // color : Color(0XFFFF006B),
                        fontSize: 30,
                      )),

                  const SizedBox(height: 20),

                  InputTextWidget(
                      inputHintText: 'Enter Your Email Here',
                      controllerUsedInInput: _emailController,
                      icon: Icons.email,
                      isPassword: false),

                  const SizedBox(height: 20),

                  InputTextWidget(
                    inputHintText: 'Enter Your Password Here',
                    controllerUsedInInput: _passwordController,
                    icon: Icons.lock,
                    isPassword: true,
                  ),

                  const SizedBox(height: 20),

                  // this part for the line of forget password and remember me !

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 0.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Checkbox(
                                  activeColor:
                                      const Color(ConstantColors.KPinkColor),
                                  checkColor:
                                      const Color(ConstantColors.KPinkColor),
                                  hoverColor:
                                      const Color(ConstantColors.KPinkColor),
                                  focusColor:
                                      const Color(ConstantColors.KPinkColor),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  }),
                              const Text('Remember Me '),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                child: Text('Forget Password?',
                                    style: TextStyle(color: Colors.grey[600]))),
                          )
                        ]),
                  ),

                  const SizedBox(height: 25),

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0XFFFF006B),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final isValid = _formKey.currentState!.validate();
                            if (!isValid) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text("This is the Error"),
                                        content: Text(
                                            'Please check again your email and your password'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text("Cancel")),
                                        ],
                                      ));
                              log("this is not valid");
                              return;
                            }
                            try {
                              await AuthService().signInWithEmailAndPassword(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  context);
                              navigatorKey.currentState!
                                  .popUntil((route) => route.isFirst);
                            } catch (e) {
                              print(e);
                              navigatorKey.currentState!
                                  .popUntil((route) => route.isFirst);
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text(
                                            'There is An error in the server'),
                                        content: const Text(
                                            'There was an error in the login please try again'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Cancel')),
                                        ],
                                      ));
                              Utils.showSnackBar(e.toString());
                            }
                          },
                          child: const Center(
                            child: Text('Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)),
                          ),
                        ),
                      )),

                  // this for the line indicating the OR Text with the lines next to the text

                  const SizedBox(height: 10),

                  const SignInUsingThirdApis(),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have An Account !  "),
                      GestureDetector(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: const Text('Sign Up Here',
                            style: TextStyle(
                              color: Color(0XFFFF006B),
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  )
                ]),
              )),
            ),
          );
  }
}
