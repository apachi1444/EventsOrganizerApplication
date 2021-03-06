import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfs/extensions/listOfCities.dart';
import 'package:pfs/extensions/validators.dart';
import 'package:pfs/services/authService.dart';

import '../../extensions/constants.dart';
import 'inputTextWidget.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback toggleView;

  const RegisterPage({Key? key, required this.toggleView}) : super(key: key);

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
  final _localisationController = TextEditingController();

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
    _localisationController.dispose();
    super.dispose();
  }

  Future doTheSignUp() async {
    if (passConfirmed()) {
      try {
        var signUp = await _auth.signUp(
            _emailController.text.trim(),
            _passwordController.text.trim(),
            _firstNameController.text.trim(),
            _lastNameController.text.trim(),
            _ageController.text.trim(),
            selectedItem!);
        print('this is the result of the sign up method ' + signUp);
        if (signUp != 'Signed Up Successfully') {
          setState(() {
            error = signUp;
          });
          return error;
        }
        else{
          return 'Signed Up Successfully';
        }
      } catch (e) {
        setState(() {
          error = e.toString();
        });
      }
    } else {
      setState(() {
        error = "Password don't match";
      });
      return error;
    }
  }

  bool passConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    }
    return false;
  }

  var list = cities;
  String? selectedItem = cities[0];

  @override
  Widget build(BuildContext context) {
    print('this is the list of all the cities ' + list.toString());
    return Theme(
      data: ThemeData(
          primarySwatch: Colors.orange,
          colorScheme: const ColorScheme.light(
            primary: Color(ConstantColors.KPinkColor),
          )),
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.verified_user,
                          size: 80,
                          color: Color(ConstantColors.KPinkColor),
                        ),
                        const SizedBox(height: 20),
                        const Text('Hello There',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 10),
                        const Text('Register below with your details',
                            style: TextStyle(
                              fontSize: 18,
                            )),

                        const SizedBox(height: 30),
                        // this part for the email inputs

                        InputTextWidget(
                            validate: EmailValidator.validate,
                            inputHintText: 'Enter Your Email Here',
                            controllerUsedInInput: _emailController,
                            icon: Icons.email,
                            isPassword: false),

                        // this part for the first name

                        const SizedBox(height: 15),
                        // this part for the first name inputs

                        InputTextWidget(
                            validate: FirstNameValidator.validate,
                            inputHintText: 'Enter Your First Name Here',
                            controllerUsedInInput: _firstNameController,
                            icon: Icons.supervised_user_circle_rounded,
                            isPassword: false),

                        // this part for the last name

                        const SizedBox(height: 15),
                        // this part for the email inputs

                        InputTextWidget(
                            validate: LastNameValidator.validate,
                            inputHintText: 'Enter Your LastName Here',
                            controllerUsedInInput: _lastNameController,
                            icon: Icons.supervised_user_circle_rounded,
                            isPassword: false),

                        // this part for the age
                        const SizedBox(height: 15),

                        // this part for the age inputs

                        InputTextWidget(
                            validate: AgeValidator.validate,
                            inputHintText: 'Enter Your Age Here',
                            controllerUsedInInput: _ageController,
                            icon: Icons.numbers_outlined,
                            isPassword: false),

                        // this part now for the password inputs

                        const SizedBox(height: 15),

                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 0),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: DropdownButtonFormField<String>(
                                    // validator: (val) =>
                                    //     val != null ? 'Enter a valid email' : null,
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Color(ConstantColors.KPinkColor),
                                    ),
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 15.0, 20.0, 15.0),
                                        prefixIcon: Icon(Icons.map),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        )),
                                    value: selectedItem,
                                    items: list
                                        .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item,
                                                style: const TextStyle(
                                                    fontSize: 12))))
                                        .toList(),
                                    onChanged: (item) {
                                      setState(() {
                                        selectedItem = item;
                                      });
                                    }),
                              ),
                            )),

                        const SizedBox(height: 20),

                        InputTextWidget(
                            validate: PasswordValidator.validate,
                            inputHintText: 'Enter Your Password Here',
                            controllerUsedInInput: _passwordController,
                            icon: Icons.lock,
                            isPassword: true),

                        const SizedBox(height: 15),

                        InputTextWidget(
                            validate: PasswordValidator.validate,
                            inputHintText: 'Confirm Your Password Here',
                            controllerUsedInInput: _confirmPasswordController,
                            icon: Icons.lock,
                            isPassword: true),

                        const SizedBox(height: 20),

                        // Sign In Button
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
                                final isValid =
                                    _formKey.currentState!.validate();
                                if (isValid) {
                                  var result = await doTheSignUp();
                                  print("this is the result " + result) ;
                                  if (result == false) {
                                    Fluttertoast.showToast(
                                        msg: error,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 25);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Signed Up successfully',
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 25);
                                    Navigator.pushReplacementNamed(
                                        context, '/authProfessional');
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          'Please check your input fields before registration',
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 25);
                                }
                              },
                              child: const Center(
                                  child: Text('Sign Up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        const SizedBox(height: 10),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "I'm a member ! ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: widget.toggleView,
                                child: const Text(
                                  '  Login Here !',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ])
                      ]),
                ),
              ),
            ),
          )),
    );
  }
}
