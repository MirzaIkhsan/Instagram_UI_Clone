import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_text_form_field.dart';
import '../constants/controller.dart';
import '../pages/login_page.dart';
import '../widgets/already_have_account.dart';
import '../widgets/custom_text_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  Widget _buildUsernameField() {
    return CustomTextFormField(
      hintText: 'Username',
      keyboardType: TextInputType.name,
      onSaved: (val) => signUpController.username = val!,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return CustomTextFormField(
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      onSaved: (val) => signUpController.email = val!,
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
      hintText: 'Password',
      isObsecure: true,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (val) => signUpController.password = val!,
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
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: size.width * 0.55,
                ),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: signUpController.key,
                    child: Column(
                      children: [
                        _buildUsernameField(),
                        SizedBox(height: 12),
                        _buildEmailField(),
                        SizedBox(height: 12),
                        _buildPasswordField(),
                        SizedBox(height: 40),
                        CustomTextButton(
                          text: 'Sign up',
                          onTap: () => userController.signUp(),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                AlreadyHaveAccount(
                    hasAccount: true, onTap: () => Get.off(() => LoginPage()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
