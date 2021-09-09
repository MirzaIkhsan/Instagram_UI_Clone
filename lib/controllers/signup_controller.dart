import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  var _signUpKey = GlobalKey<FormState>();
  var _username = TextEditingController();
  var _email = TextEditingController();
  var _password = TextEditingController();

  GlobalKey<FormState> get signUpKey => this._signUpKey;
  TextEditingController get usernameController => this._username;
  TextEditingController get emailController => this._email;
  TextEditingController get passwordController => this._password;
  String get username => this._username.text;
  String get email => this._email.text;
  String get password => this._password.text;

  set username(String username) => this._username.text = username;
  set email(String email) => this._email.text = email;
  set password(String password) => this._password.text = password;

  @override
  void onClose() {
    this._username.dispose();
    this._email.dispose();
    this._password.dispose();
    super.onClose();
  }

  bool validateForm() {
    final isValid = this._signUpKey.currentState?.validate();
    if (isValid != null && isValid) {
      this._signUpKey.currentState!.save();
      return true;
    }
    return false;
  }

  void reset() {
    this._signUpKey.currentState?.reset();
  }
}