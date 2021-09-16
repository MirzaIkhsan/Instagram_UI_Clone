import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  var _loginKey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';

  GlobalKey<FormState> get key => this._loginKey;
  String get email => this._email;
  String get password => this._password;

  set email(String email) => this._email = email;
  set password(String password) => this._password = password;

  bool validateForm() {
    final isValid = this._loginKey.currentState?.validate();
    if (isValid != null && isValid) {
      this._loginKey.currentState!.save();
      return true;
    }
    return false;
  }

  void reset() {
    this._loginKey.currentState?.reset();
  }

  void showAlertDialog() {
    Get.defaultDialog(
      title: 'Error',
      content: Text('Your account hasn\'t been registered'),
      confirm: ElevatedButton(
        onPressed: () {
          reset();
          Get.back();
        },
        child: Text('Oukeyy'),
      ),
    );
  }
}
