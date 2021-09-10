import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final userProfileController = Get.put(UserProfilePage());
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
                  'MirzaX',
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
                      imageUrl:
                          'https://drive.google.com/uc?export=view&id=1t0Jb1SuRIB5-fOE6Z8kdCsM_TguoM-DS',
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
                      'Mirza Ikhsan',
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
            ],
          ),
        ),
      ),
    );
  }
}
