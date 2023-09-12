import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void toastMessage(String title, String message) {
    Get.snackbar(title, message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xff230C02));
  }

  static void nextFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
