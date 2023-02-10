import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/screens/login%20screen/login_screen.dart';
import 'package:yali/theme/theme.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              fit: BoxFit.fill,
              "assets/svg/dron_girl.svg",
            ),
          ),
          const SizedBox(height: 35.0),
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: 'Welcome to ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                TextSpan(
                    text: 'Yali',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.orange)),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text("Send a easy and fast way delivery"),
          const SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: 45.0,
            width: 130.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LoginScreen())));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
