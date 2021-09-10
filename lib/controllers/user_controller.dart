import 'package:get/get.dart';
import 'package:instagram_clone/controllers/login_controller.dart';
import 'package:instagram_clone/controllers/signup_controller.dart';
import 'package:instagram_clone/pages/main_pages/user_profile_page.dart';
import 'package:instagram_clone/pages/main_pages_navigator.dart';

import '../models/user.dart';
import '../services/user_service.dart';

class UserController extends GetxController {
  var _user = User(
    id: 0,
    username: '',
    name: '',
    email: '',
  ).obs;

  var _loginFormState = LoginController();
  var _signUpFormState = SignUpController();

  User get user => this._user.value;
  LoginController get loginController => this._loginFormState;
  SignUpController get signUpController => this._signUpFormState;

  set user(User user) => this._user.value = user;

  Future<void> login() async {
    final validate = this._loginFormState.validateForm();
    if (validate) {
      var response = await UserService().getFromAPIByIdentity(
        this._loginFormState.email,
        this._loginFormState.password,
      );

      if (response is User) {
        this._user.value = response;
        Get.off(() => MainPagesNavigator());
      } else {
        this._loginFormState.showAlertDialog();
      }
    }
  }

  Future<void> signUp() async {
    final validate = this._signUpFormState.validateForm();
    if (validate) {
      var response = await UserService().postToAPI(
        this._signUpFormState.username,
        this._signUpFormState.email,
        this._signUpFormState.password,
      );
      if (response is User) {
        this._user.value = response;
        Get.off(() => MainPagesNavigator());
      } else {
        print(response);
        this._signUpFormState.reset();
      }
    }
  }
}
