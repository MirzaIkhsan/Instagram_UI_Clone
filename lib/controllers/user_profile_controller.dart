import 'package:get/get.dart';

class UserProfileController extends GetxController
    with SingleGetTickerProviderMixin {

  static UserProfileController instance = Get.find();
  var _photoProfileUrl =
      'https://drive.google.com/uc?export=view&id=1t0Jb1SuRIB5-fOE6Z8kdCsM_TguoM-DS'
          .obs;

  var _currentIdx = 0.obs;
  // late TabController _tabController;

  // final List<Tab> _tabs = [
  //   Tab(text: 'Hello'),
  //   Tab(text: 'World'),
  // ];

  String get photoProfileUrl => this._photoProfileUrl.value;
  int get currentIdx => this._currentIdx.value;
  // TabController get tabController => this.tabController;
  // List<Tab> get tabs => this._tabs;

  set currentIdx(int idx) => _currentIdx.value = idx;

  @override
  void onInit() {
    // _tabController = TabController(length: _tabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    // _tabController.dispose();
    super.onClose();
  }
}
