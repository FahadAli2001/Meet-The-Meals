import 'dart:convert';
import 'dart:developer';
import 'package:meethemeat/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meethemeat/customs_widget/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:meethemeat/utils/api.dart';

import '../dashboard/dashboard.dart';

class LoginController extends GetxController {
  var name = "".obs;
  var email = "".obs;
  var phoneNumber = "".obs;
  var passObsecure = true.obs;
  var checkBox = false.obs;

  void handleCheckBox(val) {
    checkBox.value = val;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser(BuildContext context) {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (emailController.text.isNotEmpty) {
        if (passwordController.text.isNotEmpty) {
          loginCall(context, emailController.text, passwordController.text);
        } else {
          customWarningSnackbar(context, "Warning!", "Please enter password");
        }
      } else {
        customWarningSnackbar(context, "Warning!", "Please enter email");
      }
    } else {
      customWarningSnackbar(context, "Warning!", "Please fill all the fields");
    }
  }

  Future loginCall(context, String email, String password) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      var response = await http.post(Uri.parse(loginApi),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        sp.setString("userId", data["_id"]);
        sp.setBool("keepLogin", checkBox.value);
        Get.offAll(() => const Dashboard());
      } else {
        log(response.statusCode.toString());
        var data = jsonDecode(response.body);
        customErrorSnackbar(context, "Error!", data["error"]);
        log(data["error"]);
      }
    } catch (e) {
      log(e.toString());
      customErrorSnackbar(context, "Error!", "Something went wrong");
    }
  }

  Future userDetail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String id = sp.getString('userId')!;
    try {
      var respones = await http.get(Uri.parse(userInfoApi + id));
      if (respones.statusCode == 200) {
        var data = jsonDecode(respones.body);

        name.value = data["data"]["name"];
        email.value = data["data"]["email"];
        phoneNumber.value = data["data"]["phonenumber"].toString();
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  void logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    Get.offAll(() => LoginScreen());
  }
}
