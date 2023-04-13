import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffFF5607),
        primarySwatch: const MaterialColor(
          0xffFF5607,
          <int, Color>{
            50: Color(0xffffe5d9),
            100: Color(0xffffc2ac),
            200: Color(0xffff9a7f),
            300: Color(0xffff7251),
            400: Color(0xffff5b2f),
            500: Color(0xffFF5607),
            600: Color(0xffff4f06),
            700: Color(0xffff4705),
            800: Color(0xffff3f04),
            900: Color(0xffff3002),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Meet the Meals',
      home: const SplashScreen(),
    );
  }
}
