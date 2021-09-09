import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/pages/sign_up_page.dart';

import '../constants.dart';
import '../controllers/user_controller.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final userController = Get.find<UserController>();

  Widget _buildEmailField() {
    return CustomTextFormField(
      controller: userController.loginController.emailController,
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      onSaved: (val) => userController.loginController.email = val!,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please input your email address';
        }
        // else if the email is not with the correct format
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return CustomTextFormField(
      controller: userController.loginController.passwordController,
      hintText: 'Password',
      isObsecure: true,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (val) => userController.loginController.password = val!,
      validator: (val) {
        if (val == null || val.length < 7) {
          return 'Password must at least 7 character';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: size.width * 0.55,
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: userController.loginController.loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildEmailField(),
                        SizedBox(height: 12),
                        _buildPasswordField(),
                        SizedBox(height: 18),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot password?',
                            textAlign: TextAlign.right,
                            style: mainFontTextStyle.copyWith(
                              fontSize: 14,
                              color: blueColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        CustomTextButton(
                          text: 'Log in',
                          onTap: () => userController.login(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: mainFontTextStyle.copyWith(
                        fontSize: 15,
                        color: Colors.white60,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignUpPage());
                      },
                      child: Text(
                        'Sign up',
                        style: mainFontTextStyle.copyWith(
                          fontSize: 15,
                          color: blueColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
