import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controllers/user_profile_controller.dart';
import 'package:instagram_clone/widgets/custom_text_button.dart';

import '/constants.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/photo_profile.dart';
import '../../widgets/user_statistics.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final userProfileController = Get.put(UserProfileController());
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 12, left: 16),
                width: size.width,
                height: 60,
                child: Text(
                  userController.user.username,
                  style: mainFontTextStyle.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PhotoProfile(
                      imageUrl: userProfileController.photoProfileUrl,
                    ),
                    SizedBox(width: 10),
                    UserStatistic(nPosts: 54, nFollowers: 834, nFollowing: 162),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userController.user.name,
                      style: mainFontTextStyle.copyWith(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: size.width / 0.5,
                      child: Text(
                        'detail',
                        maxLines: 2,
                        softWrap: false,
                        style: mainFontTextStyle.copyWith(
                          fontSize: 16.5,
                          color: Colors.white30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomTextButton(
                      text: 'Edit Profile',
                      buttonStyle: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.white24, width: 1.2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          key: GlobalKey(debugLabel: 'Gallery'),
                          onTap: () => userProfileController.currentIdx = 0,
                          child: Container(
                            height: 50,
                            child: Icon(
                              Icons.grid_on_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          key: GlobalKey(debugLabel: 'Tag'),
                          onTap: () => userProfileController.currentIdx = 1,
                          child: Container(
                            height: 50,
                            child: Icon(
                              Icons.tag_faces,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                      bottom: 0,
                      left: userProfileController.currentIdx == 0
                          ? 0
                          : size.width * 0.5,
                      child: Container(
                        width: size.width / 2,
                        height: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Obx(() {
                return userProfileController.currentIdx == 0
                    ? Wrap(
                        spacing: 2,
                        runSpacing: 2,
                        children: [
                          PhotoCard(),
                          PhotoCard(),
                          PhotoCard(),
                          PhotoCard(),
                          PhotoCard(),
                        ],
                      )
                    : SizedBox();
              })
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 2,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://drive.google.com/uc?export=view&id=1t0Jb1SuRIB5-fOE6Z8kdCsM_TguoM-DS',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
