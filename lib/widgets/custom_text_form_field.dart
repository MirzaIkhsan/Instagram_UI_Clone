import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool isObsecure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    Key? key,
    this.controller,
    required this.hintText,
    this.isObsecure = false,
    this.keyboardType,
    this.validator,
    this.onSaved,
  })  : assert(hintText != ''),
        super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;

  @override
  void initState() {
    showPassword = this.widget.isObsecure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.widget.controller,
      obscureText: showPassword,
      style: mainFontTextStyle.copyWith(color: Colors.white, fontSize: 18),
      decoration: InputDecoration(
        filled: true,
        hintText: this.widget.hintText,
        hintStyle: mainFontTextStyle.copyWith(
            fontSize: 18, color: Colors.white.withOpacity(0.6)),
        fillColor: blackColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white.withOpacity(0.2),
          width: 2.0,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white.withOpacity(0.2),
          width: 2.0,
        )),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.redAccent.withOpacity(0.2),
          width: 2.0,
        )),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.redAccent.withOpacity(0.2),
          width: 2.0,
        )),
        errorStyle: mainFontTextStyle.copyWith(
          fontSize: 12.5,
          color: Colors.white,
        ),
        suffixIcon: widget.isObsecure
            ? GestureDetector(
                onTap: () => setState(() {
                      this.showPassword = !this.showPassword;
                    }),
                child: showPassword
                    ? Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white60,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white60,
                      ))
            : SizedBox(),
      ),
      keyboardType: this.widget.keyboardType,
      validator: this.widget.validator,
      onSaved: this.widget.onSaved,
    );
  }
}
