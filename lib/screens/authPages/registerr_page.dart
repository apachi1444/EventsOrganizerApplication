import 'package:flutter/material.dart';
import 'package:pfs/extensions/constant_colors.dart';
import 'package:pfs/extensions/utils.dart';
import 'package:pfs/services/authService.dart';

class RegisterrPage extends StatefulWidget {
  final VoidCallback toggleView;

  const RegisterrPage({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<RegisterrPage> createState() => _RegisterrPageState();
}

class _RegisterrPageState extends State<RegisterrPage> {
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

  Future doTheSignUp() async {
    if (passConfirmed()) {
      return _auth.signUp(
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          _ageController.text.trim());
    } else {
      print('check your password and confirm password');
      return null;
    }
  }

  bool passConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Column(children: [
            Align(
              alignment: const Alignment(-0.8, 0.2),
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      widget.toggleView;
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  )),
            ),
          ]),
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.supervised_user_circle_outlined,
                        size: 120),
                    const SizedBox(height: 15),
                    const Text('Hello There',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        )),

                    const SizedBox(height: 30),
                    // this part for the email inputs

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(ConstantColors.KGreyColor),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.35),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(0, 3))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: TextFormField(
                              controller: _emailController,
                              // validator: (val) =>
                              //     val != null
                              //         ? 'Enter a valid email'
                              //         : null,
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.purple,
                              ),
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                                  prefixIcon: Icon(Icons.pause_rounded),
                                  hintText: 'Enter Your Email',
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ))),
                        ),
                      ),
                    ),

                    // this part for the first name

                    const SizedBox(height: 15),
                    // this part for the email inputs

                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(ConstantColors.KGreyColor),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.35),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3))
                                ]),
                            child: TextFormField(
                                controller: _firstNameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Your First Name',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                  prefixIcon: Icon(Icons.verified_user),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 15, 0, 15),
                                )))),

                    // this part for the last name

                    const SizedBox(height: 15),
                    // this part for the email inputs

                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(ConstantColors.KGreyColor),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.35),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3))
                                ]),
                            child: TextFormField(
                                controller: _lastNameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Your Last Name',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                  prefixIcon: Icon(Icons.verified_user),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 15, 0, 15),
                                )))),
                    // this part for the age
                    const SizedBox(height: 15),

                    // this part for the email inputs

                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color(ConstantColors.KGreyColor),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(ConstantColors.KGreyColor),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.grey.withOpacity(0.35),
                                      spreadRadius: 2,
                                      offset: const Offset(0, 3))
                                ]),
                            child: TextFormField(
                                controller: _ageController,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                    border: InputBorder.none,
                                    prefixIcon:
                                        Icon(Icons.verified_user, size: 22),
                                    hintText: 'Enter Your Age Please',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ))))),
                    // this part now for the password inputs

                    const SizedBox(height: 15),

                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color(ConstantColors.KGreyColor),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(ConstantColors.KGreyColor),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 3),
                                      color: Colors.grey.withOpacity(0.35))
                                ]),
                            child: TextFormField(
                                obscureText: true,
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                    border: InputBorder.none,
                                    prefixIcon:
                                        Icon(Icons.verified_user, size: 20),
                                    hintText: 'Enter Your Password here',
                                    hintStyle: TextStyle(fontSize: 15))))),
                    const SizedBox(height: 15),

                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color(ConstantColors.KGreyColor),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(ConstantColors.KGreyColor),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 3),
                                      color: Colors.grey.withOpacity(0.35))
                                ]),
                            child: TextFormField(
                                obscureText: true,
                                controller: _confirmPasswordController,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                    border: InputBorder.none,
                                    prefixIcon:
                                        Icon(Icons.verified_user, size: 20),
                                    hintText: 'Confirm Your Password here',
                                    hintStyle: TextStyle(fontSize: 15))))),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Row(children: [
                        Checkbox(
                            activeColor: const Color(ConstantColors.KPinkColor),
                            checkColor: const Color(ConstantColors.KPinkColor),
                            hoverColor: const Color(ConstantColors.KPinkColor),
                            focusColor: const Color(ConstantColors.KPinkColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value;
                              });
                            }),
                        Text('Accept Our Terms And Conditions',
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.95))),
                      ]),
                    ),

                    const SizedBox(height: 5),
                    // Sign In Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Container(
                        padding: const EdgeInsets.all(19),
                        decoration: BoxDecoration(
                            color: const Color(ConstantColors.KPinkColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: GestureDetector(
                          onTap: () async {
                            if (!_formKey.currentState!.validate()) {
                              try {
                                _auth.signUp(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                    _firstNameController.text.trim(),
                                    _lastNameController.text.trim(),
                                    _ageController.text.trim());
                              } catch (e) {
                                Utils.showSnackBar(e.toString());
                              }
                            } else {}
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

                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 30.0, right: 20.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 40,
                            )),
                      ),
                      const Text('OR'),
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 30.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 40,
                            )),
                      ),
                    ]),
                    const SizedBox(height: 10),

                    // for the external apis

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(ConstantColors.KPinkColor),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image.asset(
                                    'assets/facebookIconWhite.png',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/facebookIcon.png'),
                          radius: 15,
                          backgroundColor: Color(0xFFC7D0D8),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),

                    // not a member sign up here because

                    const SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                            color: Color(ConstantColors.KPinkColor),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ]),
                  ]),
            ),
          ),
        ));
  }
}
