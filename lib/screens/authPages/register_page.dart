import 'package:flutter/material.dart';
import 'package:pfs/services/authService.dart';

class RegisterPage extends StatefulWidget {

  final VoidCallback toggleView;


  const RegisterPage({Key? key , required this.toggleView}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();
  String error = '';

  @override
  void dispose() {
    _ageController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }


  Future  doTheSignUp() async {
    if (passConfirmed()){
      return _auth.signUp(_emailController.text.trim(), _passwordController.text.trim() , _firstNameController.text.trim() , _lastNameController.text.trim() , _ageController.text.trim());
    }
    else{
      print('check your password and confirm password');
      return null;
    }
  }


  bool passConfirmed(){
    if ( _passwordController.text.trim() == _confirmPasswordController.text.trim()){
      return true ;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor : Colors.grey[300],
        body : SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key : _formKey,
                child: Column(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children : [
                      const Icon(
                          Icons.verified_user,
                          size : 80
                      ),
                      const SizedBox(height :20),
                      const Text(
                        'Hellow There',
                        style : TextStyle(
                          fontSize :35, fontWeight :FontWeight.bold,
                        )
                      ),
                      const SizedBox(height : 10),
                      const Text(
                          'Regiser below with your details',
                          style : TextStyle(
                            fontSize : 18,
                          )
                      ),

                      const SizedBox(height :30),
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
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText : 'Email'
                                )
                            ),
                          ),
                        ),
                      ),

                      // this part for the first name

                      const SizedBox(height :15),
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
                                controller : _firstNameController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText : 'First Name'
                                )
                            ),
                          ),
                        ),
                      ),

                      // this part for the last name

                      const SizedBox(height :15),
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
                                controller : _lastNameController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText : 'Last name'
                                )
                            ),
                          ),
                        ),
                      ),

                      // this part for the age
                      const SizedBox(height :15),


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
                                controller : _ageController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText : 'Age'
                                )
                            ),
                          ),
                        ),
                      ),


                      // this part now for the password inputs

                      const SizedBox(height :15),

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
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText : 'Password',
                                )
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height : 15),

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
                                controller : _confirmPasswordController,
                                obscureText : true ,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText : 'Confirm Password',
                                )
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height : 10),

                      // Sign In Button
                      Padding(
                          padding  : const EdgeInsets.symmetric(horizontal : 20),
                            child: Container(
                                padding : const EdgeInsets.all(25),
                                decoration : BoxDecoration(
                                    color:Colors.deepPurple,
                                    borderRadius : BorderRadius.circular(20)
                                ),


                                child: GestureDetector(
                                  onTap :() async {
                                    if (_formKey.currentState!.validate()){
                                      dynamic result = doTheSignUp();
                                      if (result == null){
                                        setState((){
                                          error = 'please supply a valid email and password' ;
                                        });
                                      }
                                    }
                                  },
                                  child: const Center(
                                      child : Text(
                                          'Sign Up',
                                          style : TextStyle(
                                            color : Colors.white,
                                            fontWeight : FontWeight.bold,
                                          )
                                      )
                                  ),
                                ),
                              ),

                      ),
                      const SizedBox(height : 10),



                      const SizedBox(height : 10),

                      // not a member sign up here because

                      Row(
                          mainAxisAlignment:  MainAxisAlignment.center,
                          children : [

                            const Text("I'm a member ! " , style :TextStyle(
                                fontWeight : FontWeight.bold,
                              ),
                            ),

                            GestureDetector(
                              onTap : widget.toggleView,
                              child: const Text('  Login Here !' , style :TextStyle(
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
          ),
        )
    );
  }
}
