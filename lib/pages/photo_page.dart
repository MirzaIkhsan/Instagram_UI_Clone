import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/constants/controller.dart';
import 'package:instagram_clone/widgets/photo_profile.dart';

class PhotoPage extends StatelessWidget {
  final String imageUrl;
  const PhotoPage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 14),
                width: size.width,
                height: 60,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(Icons.arrow_back,
                            color: Colors.white, size: 30)),
                    SizedBox(width: 16),
                    Text(
                      'Postingan',
                      style: mainFontTextStyle.copyWith(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(left: 14),
                width: size.width,
                height: 50,
                child: Row(
                  children: [
                    PhotoProfile(
                      width: 45,
                      height: 45,
                      imageUrl: userProfileController.photoProfileUrl,
                    ),
                    SizedBox(width: 14),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userController.user.username,
                          style: mainFontTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        // Location, but need to go see the data structure first
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: size.width,
                height: size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(this.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
