import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/screens/profile%20screen/widget/profile_screen_card.dart';
import 'package:yali/screens/splash%20screen/splash_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(102),
          child: Container(
            height: 102,
            decoration: const BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileScreenCard(
              height: 64,
              width: double.infinity,
              color: AppColors.blue,
              title: "Profile",
            ),
            const SizedBox(
              height: 8,
            ),
            ProfileScreenCard(
              height: 64,
              width: double.infinity,
              color: AppColors.blue,
              title: "Location",
            ),
            const SizedBox(
              height: 8,
            ),
            ProfileScreenCard(
              height: 64,
              width: double.infinity,
              color: AppColors.blue,
              title: "Support",
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: ()async{
                var prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> SplashScreen()), (route) => false);
              },
              child: ProfileScreenCard(
                height: 64,
                width: double.infinity,
                color: AppColors.blue,
                title: "Logout",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
