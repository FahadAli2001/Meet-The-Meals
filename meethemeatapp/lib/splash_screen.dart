import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  Future checkLoginStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var keepLogin = sp.getBool('keepLogin');
    log(keepLogin.toString());
    Timer(const Duration(seconds: 5), () {
      if (keepLogin == null || keepLogin == false) {
        Get.offAll(() => LoginScreen());
      } else {
        Get.to(() => const Dashboard());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF5607),
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.height * 0.5,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/mtm.png'))),
        ),
      ),
    );
  }
}
