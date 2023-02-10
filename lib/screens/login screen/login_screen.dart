import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/hooks/custom_textfield.dart';
import 'package:yali/screens/dashboard%20screen/dashboard_screen.dart';
import 'package:yali/screens/login%20screen/widgets/curve_painter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "LOGIN",
                  style: TextStyle(
                      color: AppColors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                const SizedBox(height: 30.0),
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          "assets/svg/yali_logo.svg",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Welcome to ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "YALI",
                            style: TextStyle(
                                color: AppColors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
                CustomTextfield(
                    prefixIcon: const Icon(Icons.mail), hint: "E-mail"),
                const SizedBox(height: 15.0),
                CustomTextfield(
                    prefixIcon: const Icon(Icons.password), hint: "Password"),
                const SizedBox(height: 35.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashBoardScreen()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
