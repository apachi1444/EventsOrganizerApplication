import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  final String inputHintText;
  final TextEditingController controllerUsedInInput;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?)? validate;

  const InputTextWidget(
      {Key? key,
      required this.inputHintText,
      required this.controllerUsedInInput,
      required this.icon,
      required this.isPassword,
      required this.validate})
      : super(key: key);

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: TextFormField(
                validator: widget.validate,
                obscureText: widget.isPassword ? true : false,
                controller: widget.controllerUsedInInput,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.blueAccent,
                ),
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: Icon(widget.icon),
                    hintText: widget.inputHintText,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ))),
          ),
        ));
  }
}
