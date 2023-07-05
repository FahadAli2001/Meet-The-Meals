import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../customs_widget/custom_snackbar.dart';

class GoogleAuthentication extends GetxController {
  GoogleSignIn googleSignIn = GoogleSignIn();

  void signInWithGoogle(context) async {
    try {
      var result = await googleSignIn.signIn();
      log(result.toString());
    } catch (e) {
      log(e.toString());
      customErrorSnackbar(context, 'Error', 'Something went wrong');
    }
  }
}
