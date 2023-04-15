import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

///common method for showing progress dialog
void showProgressDialog({isCancellable = false}) async {
  Get.dialog(
    WillPopScope(
      onWillPop: () async => isCancellable,
      child: Center(
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white,
          ),
        ),
      ),
    ),
    barrierDismissible: isCancellable,
  );
}

///common method for showing dialog
void showCustomDialog(
    {bool isCancellable = false,
    required String msg,
    required Function onTap}) async {
  Get.dialog(
    WillPopScope(
      onWillPop: () async => isCancellable,
      child: Center(
        child: AlertDialog(
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () {
                onTap();
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: isCancellable,
  );
}

///show snackbar
void snackbar(BuildContext context, {required String msg}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
