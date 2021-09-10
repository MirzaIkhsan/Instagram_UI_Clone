import 'package:flutter/material.dart';

class PhotoProfile extends StatelessWidget {
  final String? imageUrl;
  final void Function()? onTap;
  const PhotoProfile({
    Key? key,
    this.imageUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white60,
          width: 1.5,
        ),
        shape: BoxShape.circle,
      ),
      child: Align(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 100,
            height: 100,
            child: ClipOval(
              child: (this.imageUrl == null || this.imageUrl == '')
                  ? Icon(Icons.person, size: 60, color: Colors.white60)
                  : Image.network(this.imageUrl!, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
