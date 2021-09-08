import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController {
  var _key = GlobalKey<FormState>();
  var _email = '';
  var _password = '';

  GlobalKey<FormState> get key => this._key;
  String get email => this._email;
  String get password => this._password;

  set email(String username) => this._email = username;
  set password(String password) => this._password = password;

  bool validateForm() {
    final isValid = this._key.currentState?.validate();
    if (isValid != null && isValid) {
      this._key.currentState!.save();
      return true;
    }
    return false;
  }

  void reset() {
    this._key.currentState?.reset();
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
