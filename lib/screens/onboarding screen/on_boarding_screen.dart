import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/providers/login%20provider/login_provider.dart';
import 'package:yali/screens/login%20screen/login_screen.dart';

class MyHome extends StatelessWidget {
  final Color kDarkBlueColor = Color(0xFF053149);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'conncet with YALI',
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(create: (BuildContext context)  => LoginProvider(),
            child: LoginScreen()),
          ),
        );
      },
      finishButtonColor: kDarkBlueColor,
      // skipTextButton: Text(
      //   'Skip',
      //   style: TextStyle(
      //     fontSize: 16,
      //     color: kDarkBlueColor,
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
      // trailing: Text(
      //   'Login',
      //   style: TextStyle(
      //     fontSize: 16,
      //     color: kDarkBlueColor,
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
      trailingFunction: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      controllerColor: kDarkBlueColor,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Padding(
          padding: const EdgeInsets.only(left: 90,top: 90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                
                child: Lottie.asset("assets/images/request_person.json")),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90,top: 90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                
                child: Lottie.asset("assets/images/drone.json")),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 130,top: 90),
          child: Lottie.asset("assets/images/droneDelivery.json"),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Get Started with yali...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Connect with wide range of hospitals',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'We deliver lives...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Yali will take responsibility to deliver requested items safely',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Start now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Start requesting with yali',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// Scaffold(
//         body: Container(
//       child: Column(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             child: SvgPicture.asset(
//               fit: BoxFit.fill,
//               "assets/svg/dron_girl.svg",
//             ),
//           ),
//           const SizedBox(height: 35.0),
//           RichText(
//             text: const TextSpan(
//               style: TextStyle(color: Colors.black),
//               children: <TextSpan>[
//                 TextSpan(
//                     text: 'Welcome to ',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                 TextSpan(
//                     text: 'Yali',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: AppColors.orange)),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10.0,
//           ),
//           const Text("Send a easy and fast way delivery"),
//           const SizedBox(
//             height: 15.0,
//           ),
//           SizedBox(
//             height: 45.0,
//             width: 130.0,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: ((context) => ChangeNotifierProvider(
//                             create: (BuildContext context) => LoginProvider(),
//                             child: LoginScreen()))));
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.orange,
//               ),
//               child: const Text(
//                 "Get Started",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           )
//         ],
//       ),
//     ));
