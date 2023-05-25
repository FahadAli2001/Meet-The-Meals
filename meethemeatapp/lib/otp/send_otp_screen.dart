import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:meethemeat/otp/verify_otp_screen.dart';
import 'package:meethemeat/signUp/sign_up_controller.dart';

import '../utils/utils.dart';

class SendOTPScreen extends StatelessWidget {
  SendOTPScreen({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

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
                  "Enter Phone Number",
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
                "Please enter your phone number to continue \n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tusing our app",
                style: TextStyle(
                  fontSize: Get.width * 0.04,
                  color: Colors.black,
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: signUpController.phoneNumberController,
                style: const TextStyle(height: 0.5),
                decoration: InputDecoration(
                  hintText: "+92",
                  focusColor: primaryColor,
                ),
              ),
            ),
            //

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: const [
                  Checkbox(value: true, onChanged: null),
                  Text("Get news and emails from us")
                ],
              ),
            ),
            //
            SizedBox(
              height: Get.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: SizedBox(
                width: Get.width,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor,
                    child: const Text("Send OTP"),
                    onPressed: () {
                      Get.to(() => const VerifyOTPScreen());
                    }),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
