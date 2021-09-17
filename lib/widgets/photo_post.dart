import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/constants/controller.dart';

import 'photo_profile.dart';

class PhotoPost extends StatelessWidget {
  final String username;
  final String userPhoto;
  final String postUrl;

  const PhotoPost({
    Key? key,
    required this.username,
    required this.userPhoto,
    required this.postUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.only(left: 14),
          width: size.width,
          height: 50,
          child: Row(
            children: [
              PhotoProfile(
                width: 35,
                height: 35,
                imageUrl: this.userPhoto,
              ),
              SizedBox(width: 14),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    this.username,
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
              image: NetworkImage(this.postUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, top: 8),
          child: Row(
            children: [
              Icon(
                Icons.favorite_outline,
                color: Colors.white60,
                size: 38,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.comment_outlined,
                color: Colors.white60,
                size: 35,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
