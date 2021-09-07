import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './constants.dart';
import './pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Instagram Clone UI with Local API',
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      home: LoginPage(),
    );
  }
}
