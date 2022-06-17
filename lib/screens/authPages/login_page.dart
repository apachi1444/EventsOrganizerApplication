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
import 'package:pfs/extensions/validators.dart';
import 'package:pfs/screens/professionalPages/parametersPages/forgetPassword/change_paswd.dart';
import 'package:pfs/screens/professionalPages/parametersPages/forgetPassword/enterEmailForResettingPassword.dart';
import 'package:pfs/screens/professionalPages/parametersPages/profilePage.dart';
import 'package:pfs/services/authService.dart';

import '../../extensions/constants.dart';
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

  Future doTheLogin() async {
    try {
      return await _auth.signInWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

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
                        fontSize: 30,
                      )),
                  const SizedBox(height: 20),
                  InputTextWidget(
                      validate: EmailValidator.validate,
                      inputHintText: 'Enter Your Email Here',
                      controllerUsedInInput: _emailController,
                      icon: Icons.email,
                      isPassword: false),
                  const SizedBox(height: 20),
                  InputTextWidget(
                    validate: PasswordValidator.validate,
                    inputHintText: 'Enter Your Password Here',
                    controllerUsedInInput: _passwordController,
                    icon: Icons.lock,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 0.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EnterEmailForResettingPassword()),
                              );
                            },
                            child: Text('Forget Password?',
                                style: TextStyle(color: Colors.grey[600])),
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
                            if (isValid) {
                              try {
                                var doLogin = await doTheLogin();
                                print('this is the value of the do login ');
                                print(doLogin);
                                if (doLogin != null) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/professional/switchMainPage',
                                      (r) => false);
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text(
                                                'Error in the Login',
                                                style: TextStyle(
                                                    color: Color(ConstantColors
                                                        .KPinkColor))),
                                            content: Text(error),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text('Cancel')),
                                            ],
                                          ));
                                }
                              } catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Error',
                                                  style: TextStyle(
                                                      color: Color(
                                                          ConstantColors
                                                              .KPinkColor))),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Icon(Icons.close,
                                                    color: Color(ConstantColors
                                                        .KPinkColor)),
                                              ),
                                            ],
                                          ),
                                          content: Text(error),
                                          actions: [
                                            TextButton(
                                                // onPressed: () => Navigator.of(
                                                //         context)
                                                //     .push(MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             contact_us())),
                                                //ici la navigation vers la page contact us
                                                onPressed: () {},
                                                child: const Text('Cancel')),
                                          ],
                                        ));
                              }

                              return;

                              // Utils.showSnackBar(e.toString());
                              // Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text(
                                            'There is An error in the login',
                                            style: TextStyle(
                                                color: Color(ConstantColors
                                                    .KPinkColor))),
                                        content: const Text(
                                            'There was an error in the login please try again'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Cancel')),
                                        ],
                                      ));
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
                  const SizedBox(height: 10),
                  const SignInUsingThirdApis(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 20.0 , vertical : 9),
                    child: Row(
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
                    ),
                  )
                ]),
              )),
            ),
          );
  }
}
