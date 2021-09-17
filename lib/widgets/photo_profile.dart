import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/controller.dart';
import '../controllers/story_controller.dart';

class PhotoProfile extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final void Function()? onTap;
  const PhotoProfile({
    Key? key,
    this.imageUrl,
    required this.width,
    required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StoryController());
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Obx(() {
          return Visibility(
            visible: storyController.hasStory,
            child: Container(
              width: this.width,
              height: this.height,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white60, width: 1.5),
                shape: BoxShape.circle,
              ),
            ),
          );
        }),
        Obx(() {
          return Container(
            width: storyController.hasStory ? this.width - 10 : this.width + 10,
            height:
                storyController.hasStory ? this.width - 10 : this.width + 10,
            child: ClipOval(
              child: (this.imageUrl == null || this.imageUrl == '')
                  ? Icon(Icons.person, size: 30, color: Colors.white60)
                  : Image.network(this.imageUrl!, fit: BoxFit.cover),
            ),
          );
        }),
      ],
    );
  }
}
