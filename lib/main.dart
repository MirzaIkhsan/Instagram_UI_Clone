import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './constants/constants.dart';
import './pages/sign_up_page.dart';
import './controllers/login_controller.dart';
import './controllers/user_controller.dart';
import './controllers/signup_controller.dart';

void main() {
  Get.put(SignUpController());
  Get.put(LoginController());
  Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Instagram Clone UI with Local API',
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      home: SignUpPage(),
    );
  }
}
