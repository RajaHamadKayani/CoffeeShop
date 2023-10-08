import 'dart:convert';

import 'package:coffee_shop_app/models/login_model_class/login_model_class.dart';
import 'package:coffee_shop_app/res/app_urls/app_urls.dart';
import 'package:coffee_shop_app/res/routes_names/route_names.dart';
import 'package:coffee_shop_app/respository/login_respository/login_repository.dart';
import 'package:coffee_shop_app/utils/utils.dart';
import 'package:coffee_shop_app/view/dashboard/dashboard.dart';
import 'package:coffee_shop_app/view_model/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginViewController extends GetxController {
  void dispose() {
    super.dispose();
    textEditingControllerEmail.dispose();
    textEditingControllerPassword.dispose();
  }

  UserPreferences userPreferences = UserPreferences();
  final loginRepository = LoginRepository();
  RxBool loading = false.obs;
  final textEditingControllerEmail = TextEditingController();
  final textEditingControllerPassword = TextEditingController();
  final currentFocus = FocusNode().obs;
  final nextFocus = FocusNode().obs;
  goToNext(BuildContext context) {
    Get.toNamed(RouteNames.welcomeRoute);
  }

  goToLoginView(BuildContext context) {
    Get.toNamed(RouteNames.loginRoute);
  }

  void loginpi(BuildContext context) async {
    final response = await http.post(Uri.parse(AppUrls.loginUrl), body: {
      "email": textEditingControllerEmail.value.text,
      "password": textEditingControllerPassword.value.text
    });
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var token = data["token"];
      var token1 = userPreferences.saveToken(token);
      print("token is $token1");

      Get.to(const DashBoard());
      Fluttertoast.showToast(msg: "Login Successfully!!!");
    } else {
      print("Error :${response.statusCode}");
      Fluttertoast.showToast(msg: "Login Failed");
    }
  }
}
