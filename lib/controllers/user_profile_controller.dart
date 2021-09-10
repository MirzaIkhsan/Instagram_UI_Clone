import 'package:get/get.dart';

class UserProfileController extends GetxController {
  var _photoProfileUrl = ''.obs;

  String get photoProfileUrl => this._photoProfileUrl.value;
}