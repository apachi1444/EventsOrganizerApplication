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

import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    var _emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0XFFFFFFF8),
      body : Center(
          child : Column(
              children : <Widget>[
                Container(
                  height : MediaQuery.of(context).size.height * 0.40  ,
                  width : MediaQuery.of(context).size.width * 0.7,
                  decoration : const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        bottomRight: Radius.circular(70),
                        bottomLeft: Radius.circular(70)
                    ),
                    color :  Color(0XFFFF006B),
                  ),
                  padding : const EdgeInsets.all(25),
                  child: SvgPicture.asset(
                    "assets/welcome.svg",
                    //fit: B,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.1,
                  ),
                ),

                SizedBox(height : 30),

                const Text(
                    "Welcome Abroad User",
                    style : TextStyle(
                      // color : Color(0XFFFF006B),
                      fontSize :30,
                    )
                ),

                SizedBox(height :20),



                Padding(
                    padding : EdgeInsets.symmetric(horizontal : 40  , vertical : 0),
                    child : Container(

                      decoration : BoxDecoration(
                          borderRadius : BorderRadius.circular(20),
                          color : Color(0XFFF8F4F4),
                          boxShadow: [
                            BoxShadow(
                                color : Colors.grey.withOpacity(0.6),
                                blurRadius: 0.6,
                                spreadRadius : 0.8,
                                offset: Offset(0,4)
                            )
                          ]
                      ),

                      child : Padding(
                        padding : EdgeInsets.symmetric(horizontal : 10 , vertical : 0),
                        child: TextField(
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blueAccent,
                            ),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                prefixIcon: Icon(Icons.mail),
                                hintText: "Enter Your Name",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 32.0),
                                    borderRadius: BorderRadius.circular(25.0)
                                )
                            )
                        ),


                      ),
                    )
                ),

                SizedBox(height :20),


                Padding(
                    padding : EdgeInsets.symmetric(horizontal : 40  , vertical : 0),
                    child : Container(

                      decoration : BoxDecoration(
                          borderRadius : BorderRadius.circular(20),
                          color : Color(0XFFF8F4F4),
                          boxShadow: [
                            BoxShadow(
                                color : Colors.grey.withOpacity(0.6),
                                blurRadius: 0.6,
                                spreadRadius : 0.8,
                                offset: Offset(0,4)
                            )
                          ]
                      ),

                      child : Padding(
                          padding : EdgeInsets.symmetric(horizontal : 10 , vertical : 0),
                          child: TextField(
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.blueAccent,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Icon(Icons.pause_rounded),
                                  hintText: "Enter Your Email",
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 32.0),
                                      borderRadius: BorderRadius.circular(25.0)
                                  )
                              )
                          ),


                      ),
                    )
                ),



                SizedBox(height : 20),

                // this part for the line of forget password and remember me !

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal : 43.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child : Row(
                          children: [
                            CheckboxListTile(
                              value: false,
                              onChanged: (bool? value){
                                setState(){
                                  _value = value!;
                                }
                              },
                            ), //Checkb
                            Text("Remember Me "),
                          ],
                        ),
                      ),
                      Container(
                          child:
                            Text(
                                "Forget Password?",
                                style : TextStyle(
                                  color : Colors.grey[600]
                                )
                            )
                      )
                    ]
                  ),
                ),

                SizedBox(height :25),


                Padding(
                    padding : EdgeInsets.symmetric(horizontal : 20),
                    child : Container(
                      width : MediaQuery.of(context).size.width  * 0.6,
                      padding : EdgeInsets.all(20),
                      decoration : BoxDecoration(
                          color :  Color(0XFFFF006B),
                          borderRadius:BorderRadius.circular(40),

                      ),

                      child : GestureDetector(
                        onTap : (){

                        },
                        child: const Center(
                          child:  Text(
                              "Sign In",
                              style : TextStyle(
                                  color : Colors.white ,
                                  fontWeight : FontWeight.bold,
                                  fontSize : 17
                              )
                          ),
                        ),
                      ) ,
                    )
                ),

                // this for the line indicating the OR Text with the lines next to the text

                SizedBox(height : 10),

                Row(children: <Widget>[
                  Expanded(
                    child:  Container(
                        margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                        child: Divider(
                          color: Colors.black,
                          height: 50,
                        )),
                  ),
                  Text("OR"),
                  Expanded(
                    child:  Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 30.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                ]),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage("assests/googleIcon.png"),
                        radius : 15,
                        backgroundColor : Color(0xFFC7D0D8),
                      ),
                      SizedBox(width : 10),
                      CircleAvatar(
                        backgroundImage: AssetImage("assests/facebookIcon.png"),
                        radius : 15,
                        backgroundColor : Color(0xFFC7D0D8),
                      ),
                      SizedBox(width : 10),
                      CircleAvatar(
                        backgroundImage: AssetImage("assests/instagramIcon.png"),
                        radius : 15,
                        backgroundColor : Color(0xFFC7D0D8),
                      ),
                    ],
                  ),
                ),

                SizedBox(height : 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have An Account !  "),
                    Text(
                        "Sign Up Here",
                        style : TextStyle(
                          color  : Color(0XFFFF006B),
                          fontWeight : FontWeight.bold,
                        )
                    )
                  ],
                )

              ]
          )
      ),
    );
  }

}

