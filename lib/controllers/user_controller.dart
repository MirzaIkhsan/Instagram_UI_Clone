import 'package:get/get.dart';

import '../models/user.dart';
import '../services/user_service.dart';
import '../constants/controller.dart';
import '../pages/main_pages_navigator.dart';

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
