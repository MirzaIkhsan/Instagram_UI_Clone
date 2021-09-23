import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants/constants.dart';
import '../constants/controller.dart';
import '../widgets/photo_post.dart';

class PhotoPage extends StatelessWidget {
  final int index;
  const PhotoPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Postingan',
            style: mainFontTextStyle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        body: ScrollablePositionedList.builder(
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
