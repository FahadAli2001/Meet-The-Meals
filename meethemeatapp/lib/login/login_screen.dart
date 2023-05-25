import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:meethemeat/login/login_controller.dart';
import 'package:meethemeat/signUp/sign_up.dart';
import 'package:meethemeat/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  "Login",
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
                "Please login to continue using your app",
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: loginController.emailController,
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Obx(
                () => TextField(
                  controller: loginController.passwordController,
                  style: const TextStyle(height: 0.5),
                  obscureText: loginController.passObsecure.value,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (loginController.passObsecure.value == true) {
                            loginController.passObsecure.value = false;
                          } else {
                            loginController.passObsecure.value = true;
                          }
                        },
                        icon: (loginController.passObsecure.value == true)
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Obx(
                    () => Checkbox(
                        value: loginController.checkBox.value,
                        onChanged: (value) {
                          loginController.handleCheckBox(value);
                        }),
                  ),
                  const Text("Keep me logged in")
                ],
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: const [
                  SizedBox(
                    width: 120,
                    child: Divider(
                      height: 0.2,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text("or continue with"),
                  ),
                  SizedBox(
                    width: 120,
                    child: Divider(
                      height: 0.2,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140),
              child: Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.google),
                      color: Colors.red,
                    ),
                    //
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: Get.width,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor,
                    child: const Text("Login"),
                    onPressed: () {
                      loginController.loginUser(context);
                    }),
              ),
            ),

            //

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Sign up now >',
                          style: TextStyle(color: primaryColor, fontSize: 15),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => SignUpScreen());
                            })
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
