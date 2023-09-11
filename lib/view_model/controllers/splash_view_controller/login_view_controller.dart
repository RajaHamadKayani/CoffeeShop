import 'package:coffee_shop_app/res/routes_names/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController {
  goToNext() {
    Get.toNamed(RouteNames.loginRoute);
  }
}
