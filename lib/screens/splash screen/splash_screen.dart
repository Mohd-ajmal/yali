import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yali/providers/bottom%20navigation%20provider/bottm_navigation_provider.dart';
import 'package:yali/providers/dashboard%20provider/dashboard_provider.dart';
import 'package:yali/screens/bottom%20navigation%20screen/bottom_navigation_screen.dart';
import 'package:yali/screens/dashboard%20screen/dashboard_screen.dart';
import 'package:yali/screens/onboarding%20screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool? status;

firstLoginCheck() async {
  var prefs = await SharedPreferences.getInstance();
  status = prefs.getBool("firstLogin");
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    firstLoginCheck();
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (status == false) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: ((context) => ChangeNotifierProvider(
                    create: (BuildContext context) => BottomNavigationProvider(),
                    child: BottomNavigationScreen()))),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: ((context) => MyHome())),
            (route) => false);
      }

      timer.cancel();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/yali_logo.svg",
              ),
              // Padding(
              //   padding: const EdgeInsets.all(60.0),
              //   child: Lottie.asset('assets/images/blueDrone.json',repeat: true,reverse: true),
              // ),
              // Lottie.asset('assets/images/loading.json',height: 100,width: 150),
              // const Text("Loading...")
            ],
          ),
        ));
  }
}
