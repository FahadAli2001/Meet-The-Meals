import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const LoginScreen());
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
