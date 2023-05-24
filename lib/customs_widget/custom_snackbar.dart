import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void customWarningSnackbar(BuildContext context, String title, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.startToEnd,
      duration: const Duration(seconds: 3),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: msg,
        messageFontSize: 15,
        contentType: ContentType.warning,
      ),
    ),
  );
}

void customErrorSnackbar(BuildContext context, String title, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.startToEnd,
      duration: const Duration(seconds: 3),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: msg,
        messageFontSize: 15,
        contentType: ContentType.failure,
      ),
    ),
  );
}

void customSuccessSnackbar(BuildContext context, String title, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.startToEnd,
      duration: const Duration(seconds: 3),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: msg,
        messageFontSize: 15,
        contentType: ContentType.success,
      ),
    ),
  );
}
