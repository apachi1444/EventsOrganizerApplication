import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";

import '../userPages/forgetPass_page.dart';
class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage ;

  const LoginPage({Key? key , required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    print('haha');
    print(_emailController.text.trim());
    print(_passwordController.text.trim());
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email : _emailController.text.trim() ,
      password : _passwordController.text.trim(),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.grey[300],
      body : SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment : MainAxisAlignment.center,

                children : [
                  Icon(
                    Icons.phone_android,
                    size : 80
                  ),
                  SizedBox(height :30),
                  Text(
                      "Hellow Again Dear User",
                  ),
                  SizedBox(height : 10),
                  Text(
                      "You've Been Missed \"Bro ",
                      style : TextStyle(
                        fontSize : 18,
                      )
                  ),

                  SizedBox(height :60),
                  // this part for the email inputs

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 20),
                    child: Container(
                      decoration : BoxDecoration(
                        color : Colors.white ,
                        border :Border.all(color : Colors.white),
                        borderRadius : BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left : 20),
                        child: TextField(
                          controller : _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText : "Email"
                          )
                        ),
                      ),
                    ),
                  ),


                  // this part now for the password inputs

                  SizedBox(height :10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 20),
                    child: Container(
                      decoration : BoxDecoration(
                        color : Colors.white ,
                        border :Border.all(color : Colors.white),
                        borderRadius : BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left : 20),
                        child: TextField(
                            controller : _passwordController,
                            obscureText : true ,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText : "Password",
                          )
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height : 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment :  MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap : (){
                            Navigator.push(context , MaterialPageRoute(builder:
                            (context){
                              return ForgetPassPage();
                            }
                            )
                            );
                          },
                          child: const Text("Forget Password?",
                            style : TextStyle(
                              color : Colors.blue,
                              fontWeight : FontWeight.bold,
                            )
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height : 10),
                  // Sign In Button
                  Padding(
                    padding  : const EdgeInsets.symmetric(horizontal : 20),
                    child : GestureDetector(
                      onTap : signIn,
                      child: Container(
                        padding : EdgeInsets.all(25),
                        decoration : BoxDecoration(
                            color:Colors.deepPurple,
                            borderRadius : BorderRadius.circular(20)
                        ),
                        child : Center(
                          child : Text(
                            "Sign In",
                            style : TextStyle(
                                color : Colors.white,
                                fontWeight : FontWeight.bold,
                            )
                          )
                        )
                      ),
                    )
                  ),

                  const SizedBox(height : 20),


                  const SizedBox(height : 20),

                  // not a member sign up here because

                  Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children : [
                      Text("Don't Have An Account ! " , style :TextStyle(
                          fontWeight : FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap : widget.showRegisterPage,
                        child: Text("  Register Here !" , style :TextStyle(
                          color : Colors.blue,
                          fontWeight : FontWeight.bold,
                        ),
                        ),
                      )
                    ]
                  )


                ]
            ),
          ),
        ),
      )
    );
  }
}
