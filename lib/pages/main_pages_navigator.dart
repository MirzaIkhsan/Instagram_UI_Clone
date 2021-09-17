import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';
import '../pages/main_pages/user_profile/user_profile_page.dart';

class MainPagesNavigator extends StatefulWidget {
  const MainPagesNavigator({Key? key}) : super(key: key);

  @override
  _MainPagesNavigatorState createState() => _MainPagesNavigatorState();
}

class _MainPagesNavigatorState extends State<MainPagesNavigator> {
  final _pageController = PageController(initialPage: 4);
  final userProfileController = Get.put(UserProfileController());

  int _currentPageIdx = 4;
  late List<Widget> _pages;
  late List<BottomNavigationBarItem> _bottomNavigationBarItems;

  @override
  void initState() {
    _pages = [
      UserProfilePage(),
      UserProfilePage(),
      UserProfilePage(),
      UserProfilePage(),
      UserProfilePage(),
    ];

    _bottomNavigationBarItems = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: 'Home Page'),
      BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined), label: 'Search Page'),
      BottomNavigationBarItem(
          icon: Icon(Icons.add_alarm_outlined), label: 'Add Photo Page'),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline), label: 'Favorite Page'),
      BottomNavigationBarItem(
          icon: _buildUserIconImage(), label: 'Profile Page'),
    ];

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int idx) {
    setState(() {
      this._currentPageIdx = idx;
    });
  }

  void _onItemTap(int idx) {
    _pageController.jumpToPage(idx);
  }

  Widget _buildUserIconImage() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(userProfileController.photoProfileUrl),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF48484A),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTap,
        items: _bottomNavigationBarItems,
        currentIndex: _currentPageIdx,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Color(0xFF48484A),
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        enableFeedback: false,
      ),
    );
  }
}
