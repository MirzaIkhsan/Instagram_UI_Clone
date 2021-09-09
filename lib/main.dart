import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controllers/user_controller.dart';
import 'package:instagram_clone/pages/sign_up_page.dart';

import './constants.dart';
import './pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return GetMaterialApp(
      title: 'Instagram Clone UI with Local API',
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      home: LoginPage(),
    );
  }
}
