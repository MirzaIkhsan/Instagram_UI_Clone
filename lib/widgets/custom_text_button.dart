import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final void Function()? onTap;

  const CustomTextButton({
    Key? key,
    required this.text,
    this.textColor,
    this.buttonColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: this.buttonColor ?? blueColor,
        child: Center(
          child: Text(
            this.text,
            style: mainFontTextStyle.copyWith(
              fontSize: 18,
              color: this.textColor ?? Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
