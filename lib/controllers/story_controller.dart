import 'package:get/get.dart';

class StoryController extends GetxController {
  static StoryController instance = Get.find();
  var _hasStory = false.obs;

  bool get hasStory => this._hasStory.value;
}
