import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/otp/send_otp_screen.dart';

import '../utils/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.14,
                decoration: const BoxDecoration(
                    //color: Colors.amber,
                    image: DecorationImage(
                        image: AssetImage('assets/Rectangle 1.png'),
                        fit: BoxFit.fill)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 70,
                      // color: Colors.white,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/mtm.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: Get.width * 0.07,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //
              Center(
                child: Text(
                  "Please Sign up to continue using your app",
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    color: Colors.black,
                  ),
                ),
              ),
              //
              SizedBox(
                height: Get.height * 0.1,
              ),
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: const TextStyle(height: 0.5),
                  decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                      focusColor: primaryColor,
                      border: const OutlineInputBorder()),
                ),
              ),
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: const TextStyle(height: 0.5),
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      labelText: "Email",
                      focusColor: primaryColor,
                      border: const OutlineInputBorder()),
                ),
              ),
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: const TextStyle(height: 0.5),
                  decoration: InputDecoration(
                      suffixIcon: const Icon(CupertinoIcons.eye),
                      hintText: "Enter Password",
                      labelText: "Password",
                      focusColor: primaryColor,
                      border: const OutlineInputBorder()),
                ),
              ),
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: const TextStyle(height: 0.5),
                  decoration: InputDecoration(
                      suffixIcon: const Icon(CupertinoIcons.eye),
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      focusColor: primaryColor,
                      border: const OutlineInputBorder()),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: const [
                    Checkbox(value: true, onChanged: null),
                    Text("Agree with our terms and conditions")
                  ],
                ),
              ),
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: Get.width,
                  child: CupertinoButton(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryColor,
                      child: const Text("Next"),
                      onPressed: () {
                        Get.to(() => const SendOTPScreen());
                      }),
                ),
              ),

              //

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                      text: 'Already have an account?',
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Log in now >',
                            style: TextStyle(color: primaryColor, fontSize: 15),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.back();
                              })
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
