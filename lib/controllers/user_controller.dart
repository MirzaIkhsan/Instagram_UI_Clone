import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constants.dart';

import './form_controller.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserController extends GetxController {
  var _user = User(
    id: 0,
    name: '',
    email: '',
  ).obs;

  var _formState = FormController();

  User get user => this._user.value;
  FormController get form => this._formState;

  set user(User user) => this._user.value = user;

  Future<void> login() async {
    final validate = this._formState.validateForm();
    if (validate) {
      var response = await UserService().getFromAPIByIdentity(
        this._formState.email,
        this._formState.password,
      );

      if (response is User) {
        user = response;
      } else {
        Get.defaultDialog(
          title: 'Error',
          content: Text('Your account hasn\'t been registered'),
          confirm: ElevatedButton(
            onPressed: () {
              this._formState.reset();
              Get.back();
            },
            child: Text('Oukeyy'),
          ),
        );
      }
    }
  }
}
