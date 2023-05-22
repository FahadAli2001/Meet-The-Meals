import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

// ignore: must_be_immutable
class CustomSnackbar extends GetBar {
  String title;
  String msg;

  CustomSnackbar({
    super.key,
    required this.title,
    required this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.orange,
      dismissDirection: DismissDirection.up,
      content: AwesomeSnackbarContent(
        title: title,
        message: msg,
        contentType: ContentType.warning,
      ),
    );
  }
}
