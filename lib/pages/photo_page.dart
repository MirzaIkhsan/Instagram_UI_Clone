import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/widgets/photo_post.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants/constants.dart';
import '../constants/controller.dart';

class PhotoPage extends StatelessWidget {
  final int index;
  const PhotoPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  Widget _customAppBar(Size size) {
    return Container(
      padding: EdgeInsets.only(left: 14),
      width: size.width,
      height: 60,
      child: Row(
        children: [
          GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 30)),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ScrollablePositionedList.builder(
          initialScrollIndex: this.index,
          itemCount: picts.length,
          itemBuilder: (context, idx) {
            return PhotoPost(
              username: userController.user.name,
              userPhoto: userProfileController.photoProfileUrl,
              postUrl: picts[idx],
            );
          },
        ),
      ),
    );
  }
}
