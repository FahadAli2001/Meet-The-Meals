import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meethemeat/customs_widget/custom_snackbar.dart';
import 'package:meethemeat/login/login_screen.dart';
import 'package:meethemeat/otp/otp_controller.dart';
import 'package:meethemeat/otp/verify_otp_screen.dart';
import 'package:meethemeat/utils/api.dart';

import '../otp/send_otp_screen.dart';

class SignUpController extends GetxController {
  OtpController otpController = Get.put(OtpController());
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  var agreeWithTerms = false.obs;
  var password = true.obs;
  var conPassword = true.obs;

  void handleCheckBox(val) {
    agreeWithTerms.value = val;
  }

  Future registerUser(BuildContext context) async {
    if (userNameController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        passwordController.text.isNotEmpty ||
        confirmPasswordController.text.isNotEmpty) {
      if (userNameController.text.isNotEmpty) {
        if (emailController.text.isNotEmpty) {
          if (passwordController.text.isNotEmpty) {
            if (confirmPasswordController.text.isNotEmpty) {
              if (passwordController.text == confirmPasswordController.text) {
                if (agreeWithTerms.value == true) {
                  Get.to(() => SendOTPScreen());
                } else {
                  customWarningSnackbar(context, "Opps!",
                      "Please agree with our terms and conditions");
                }
              } else {
                customErrorSnackbar(context, "Error!", "Password not matched");
              }
            } else {
              customWarningSnackbar(
                  context, "Opps!", "Please enter confirm password");
            }
          } else {
            customWarningSnackbar(context, "Warning!", "Please enter password");
          }
        } else {
          customWarningSnackbar(context, "Warning!", "Please enter email");
        }
      } else {
        customWarningSnackbar(context, "Warning!", "Please enter user name");
      }
    } else {
      customWarningSnackbar(context, "Warning!", "Please fill all the fields");
    }
  }

  void registerNumber(BuildContext context) {
    if (phoneNumberController.text.isNotEmpty) {
      Get.to(() => const VerifyOTPScreen());
    } else {
      customWarningSnackbar(
          context, "Warning!", "Please fill phone number field");
    }
  }

  Future registerUserInfo(context, String name, String email, String password,
      String phoneNumber) async {
    // ignore: unrelated_type_equality_checks
    try {
      var response = await http.post(Uri.parse(registrationApi), body: {
        "name": name,
        "email": email,
        "password": password,
        "phonenumber": phoneNumber
      });
      if (response.statusCode == 200) {
        Get.offAll(() => LoginScreen());
        customSuccessSnackbar(
            context, "Congratz!!", "User created successfully");
      } else {
        log(response.statusCode.toString());
        log(response.body);
        customErrorSnackbar(
            context, "Error", "SomeThing went wrong please try again");
      }
    } catch (e) {
      log("catch body");
      log(e.toString());
      customErrorSnackbar(context, "Error", "SomeThing went wrong ");
    }
  }
}
