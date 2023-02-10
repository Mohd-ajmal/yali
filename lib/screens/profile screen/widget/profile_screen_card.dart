import 'package:flutter/material.dart';
import 'package:yali/constants/app_colors.dart';

class ProfileScreenCard extends StatelessWidget {
  double height;
  double width;
  String title;
  Color color;
  ProfileScreenCard(
      {super.key,
      required this.height,
      required this.width,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: AppColors.profile, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
