import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardCard extends StatelessWidget {
  double height;
  double width;
  String title;
  String imagePath;
  Color color;
  DashBoardCard(
      {super.key,
      required this.height,
      required this.width,
      required this.title,
      required this.imagePath,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(boxShadow: const <BoxShadow>[
        BoxShadow(
            color: Colors.grey, blurRadius: 6.0, offset: Offset(0.0, 0.50))
      ], color: color, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title == "History" || title == "Track"
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(imagePath, width: 40, height: 40),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SvgPicture.asset(imagePath, width: 40, height: 40),
                ),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
