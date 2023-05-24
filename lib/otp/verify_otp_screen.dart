import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/otp/otp_controller.dart';
import 'package:meethemeat/signUp/sign_up_controller.dart';
import 'package:meethemeat/utils/utils.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

// ignore: must_be_immutable
class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  OtpController optController = Get.put(OtpController());
  SignUpController signUpController = Get.put(SignUpController());

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      optController.generateRandomNumber();
    });
    super.initState();
  }

  // @override
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
                    "Verify Phone Number",
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
                  "Enter OTP we send to +92**********",
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    color: Colors.black,
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: OTPTextField(
                  controller: optController.verifyOtpController,
                  otpFieldStyle: OtpFieldStyle(
                      enabledBorderColor: primaryColor,
                      focusBorderColor: primaryColor,
                      borderColor: primaryColor),
                  length: 4,
                  width: Get.width,
                  fieldWidth: 50,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    // ignore: prefer_interpolation_to_compose_strings
                    log("Completed: " + pin);
                  },
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: RichText(
                  text: TextSpan(
                      text: ' Don\'t recieve OTP ? ',
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Rsend OTP ',
                            style: TextStyle(color: primaryColor, fontSize: 15),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ]),
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
                child: SizedBox(
                  width: Get.width,
                  child: CupertinoButton(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryColor,
                      child: const Text("Verify OTP"),
                      onPressed: () {
                        signUpController.registerUserInfo(
                            context,
                            signUpController.userNameController.text,
                            signUpController.emailController.text,
                            signUpController.passwordController.text,
                            signUpController.phoneNumberController.text);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
