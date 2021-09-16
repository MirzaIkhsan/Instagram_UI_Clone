import 'package:get/get.dart';
import 'package:instagram_clone/constants/controller.dart';
import 'package:instagram_clone/controllers/login_controller.dart';
import 'package:instagram_clone/controllers/signup_controller.dart';
import 'package:instagram_clone/pages/main_pages/user_profile_page.dart';
import 'package:instagram_clone/pages/main_pages_navigator.dart';

import '../models/user.dart';
import '../services/user_service.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  var _user = User(
    id: 0,
    username: '',
    name: '',
    email: '',
  ).obs;

  User get user => this._user.value;

  set user(User user) => this._user.value = user;

  Future<void> login() async {
    final validate = loginController.validateForm();
    if (validate) {
      var response = await UserService().getFromAPIByIdentity(
        loginController.email,
        loginController.password,
      );

      if (response is User) {
        this._user.value = response;
        Get.off(() => MainPagesNavigator());
      } else {
        loginController.showAlertDialog();
      }
    }
  }

  Future<void> signUp() async {
    final validate = signUpController.validateForm();
    if (validate) {
      var response = await UserService().postToAPI(
        signUpController.username,
        signUpController.email,
        signUpController.password,
      );
      if (response is User) {
        this._user.value = response;
        Get.off(() => MainPagesNavigator());
      } else {
        print(response);
        signUpController.reset();
      }
    }
  }
}
