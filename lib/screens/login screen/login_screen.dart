// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yali/constants/app_colors.dart';
import 'package:yali/hooks/custom_textfield.dart';
import 'package:yali/model/login_model.dart';
import 'package:yali/providers/bottom%20navigation%20provider/bottm_navigation_provider.dart';
import 'package:yali/providers/login%20provider/login_provider.dart';
import 'package:yali/screens/bottom%20navigation%20screen/bottom_navigation_screen.dart';
import 'package:yali/screens/dashboard%20screen/dashboard_screen.dart';
import 'package:yali/screens/login%20screen/widgets/curve_painter.dart';
import 'package:yali/service/service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
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
                  TextFormField(
                      controller: provider.emailController,
                      validator: (value) {
                        if (value == null) {
                          return "Field can't be empty";
                        } else if (value.isEmpty) {
                          return "Field can't be empty";
                        } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value) ==
                            false) {
                          return "Invalid E-mail";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                           disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          
                          hintText: "E-mail",
                          prefixIcon: const Icon(Icons.mail))),
                  const SizedBox(height: 15.0),
                  TextFormField(
                      controller: provider.passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null) {
                          return "Field can't be empty";
                        } else if (value.isEmpty) {
                          return "Field can't be empty";
                        } else if (value.length < 5) {
                          return "Too short";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          // focusedErrorBorder: InputBorder(borderSide: ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.password))),
                  const SizedBox(height: 35.0),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          var response = await HttpService.loginHttp(
                              context: context,
                              email: provider.emailController.text,
                              password: provider.passwordController.text);
                          if (response.runtimeType == null) {
                            provider.showFailureSnackBar(
                                context: context, msg: "Something went wrong");
                          } else if (response.runtimeType == String) {
                            provider.showFailureSnackBar(
                                context: context, msg: response);
                          } else if (response.runtimeType == LoginModel) {
                            LoginModel loginResponse = response;
                            var prefs = await SharedPreferences.getInstance();
                            
                            if (prefs.getBool("firstLogin") == null) {
                              prefs.setBool("firstLogin", false);
                            }
                            provider.showSuccessSnackBar(
                                context: context, msg: loginResponse.message);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       ChangeNotifierProvider(create: (BuildContext context) => BottomNavigationProvider(),
                                       child: const BottomNavigationScreen())),
                              (route) => false);
                          }
                          
                        }
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
      ),
    );
  }
}
