import 'package:flutter/material.dart';

class DisplayUserProfilePic extends StatelessWidget {
  final String imagePath;

  const DisplayUserProfilePic({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(imagePath),
      ),
    );
  }
}
