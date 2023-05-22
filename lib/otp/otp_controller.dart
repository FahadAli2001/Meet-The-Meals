import 'dart:math';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

class OtpController extends GetxController {
  final OtpFieldController verifyOtpController = Get.put(OtpFieldController());
  var otp = 0.obs;
  List<String> otpList = [];

  void generateRandomNumber() {
    final random = Random();
    otpList.clear();

    for (var i = 0; i < 4; i++) {
      otp.value = random.nextInt(9000) + 1000;
      otpList.add(otp.value.toString()[i]);
    }

    verifyOtpController.set(otpList);
  }
}
