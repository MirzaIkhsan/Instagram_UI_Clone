import 'package:flutter/material.dart';

import '../constants/constants.dart';


class AlreadyHaveAccount extends StatelessWidget {
  final bool hasAccount;
  final void Function()? onTap;
  const AlreadyHaveAccount({
    Key? key,
    this.hasAccount = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          !this.hasAccount
              ? 'Don\'t have an account? '
              : 'Already have account? ',
          style: mainFontTextStyle.copyWith(
            fontSize: 15,
            color: Colors.white60,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            !this.hasAccount ? 'Sign up' : 'Sign in',
            style: mainFontTextStyle.copyWith(
              fontSize: 15,
              color: blueColor,
            ),
          ),
        ),
      ],
    );
  }
}