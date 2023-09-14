import 'package:coffee_shop_app/models/login_model_class/login_model_class.dart';
import 'package:coffee_shop_app/res/routes_names/route_names.dart';
import 'package:coffee_shop_app/respository/login_respository/login_repository.dart';
import 'package:coffee_shop_app/utils/utils.dart';
import 'package:coffee_shop_app/view_model/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController {
  void dispose() {
    super.dispose();
    textEditingControllerEmail.dispose();
    textEditingControllerPassword.dispose();
  }

  UserPreferences userPreferences = UserPreferences();
  final loginRepository = LoginRepository();
  RxBool loading = false.obs;
  dynamic textEditingControllerEmail = TextEditingController().obs;
  dynamic textEditingControllerPassword = TextEditingController().obs;
  final currentFocus = FocusNode().obs;
  final nextFocus = FocusNode().obs;
  goToNext(BuildContext context) {
    Get.toNamed(RouteNames.welcomeRoute);
  }

  goToLoginView(BuildContext context) {
    Get.toNamed(RouteNames.loginRoute);
  }

  loginApi() async {
    try {
      loading = true.obs;

      Map data = {
        "email": textEditingControllerEmail.value.text,
        "password": textEditingControllerPassword.value.text
      };
      loginRepository.loginApi(data).then((value) {
        userPreferences
            .saveToken(LoginModelClass.fromJson(value))
            .then((value) {
          loading = false.obs;
          print("User Data stored successfully");
          Get.toNamed(RouteNames.dashborad);
        }).onError((error, stackTrace) {
          loading = false.obs;
          print("Error to save user's data");
        });
        Utils.toastMessage("Login", "Login Successfully");
      }).onError((error, stackTrace) {
        Utils.toastMessage("Login", error.toString());
      });
    } catch (e) {
      loading = false.obs;
      Utils.toastMessage("Login", e.toString());
    }
  }
}
