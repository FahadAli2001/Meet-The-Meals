import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/signUp/sign_up_controller.dart';

import '../utils/utils.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  SignUpController signUpController = Get.put(SignUpController());

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
                  controller: signUpController.userNameController,
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
                  controller: signUpController.emailController,
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
                child: Obx(
                  () => TextField(
                    obscureText: signUpController.password.value,
                    controller: signUpController.passwordController,
                    style: const TextStyle(height: 0.5),
                    decoration: InputDecoration(
                        // suffixIcon:  Icon(CupertinoIcons.eye),
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (signUpController.password.value == true) {
                              signUpController.password.value = false;
                            } else {
                              signUpController.password.value = true;
                            }
                          },
                          icon: (signUpController.password.value == false)
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        hintText: "Enter Password",
                        labelText: "Password",
                        focusColor: primaryColor,
                        border: const OutlineInputBorder()),
                  ),
                ),
              ),
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Obx(
                  () => TextField(
                    obscureText: signUpController.conPassword.value,
                    controller: signUpController.confirmPasswordController,
                    style: const TextStyle(height: 0.5),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (signUpController.conPassword.value == true) {
                                signUpController.conPassword.value = false;
                              } else {
                                signUpController.conPassword.value = true;
                              }
                            },
                            icon: (signUpController.conPassword.value == false)
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
                        focusColor: primaryColor,
                        border: const OutlineInputBorder()),
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: signUpController.agreeWithTerms.value,
                          onChanged: (val) {
                            signUpController.handleCheckBox(val);
                          }),
                    ),
                    const Text("Agree with our terms and conditions")
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
                        signUpController.registerUser(
                          context,
                        );
                        //  Get.to(() => const SendOTPScreen());
                      }),
                ),
              ),

              // co

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
