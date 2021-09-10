import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Decoration? buttonStyle;
  final void Function()? onTap;

  const CustomTextButton({
    Key? key,
    required this.text,
    this.textStyle,
    this.buttonStyle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: buttonStyle ?? BoxDecoration(color: blueColor),
        child: Center(
          child: Text(
            this.text,
            style: textStyle ??
                mainFontTextStyle.copyWith(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  }
}
