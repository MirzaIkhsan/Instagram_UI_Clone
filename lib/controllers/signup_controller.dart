import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  static SignUpController instance = Get.find();
  var _signUpKey = GlobalKey<FormState>();
  var _username = '';
  var _email = '';
  var _password = '';

  GlobalKey<FormState> get key => this._signUpKey;
  String get username => this._username;
  String get email => this._email;
  String get password => this._password;

  set username(String username) => this._username = username;
  set email(String email) => this._email = email;
  set password(String password) => this._password = password;

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