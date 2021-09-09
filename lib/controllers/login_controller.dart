import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var _loginKey = GlobalKey<FormState>();
  var _email = TextEditingController();
  var _password = TextEditingController();

  GlobalKey<FormState> get loginKey => this._loginKey;
  TextEditingController get emailController => this._email;
  TextEditingController get passwordController => this._password;
  String get email => this._email.text;
  String get password => this._password.text;

  set email(String email) => this._email.text = email;
  set password(String password) => this._password.text = password;

  @override
  void onClose() {
    this._email.dispose();
    this._password.dispose();
    super.onClose();
  }

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
