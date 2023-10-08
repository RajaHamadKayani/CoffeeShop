import 'package:coffee_shop_app/view_model/controllers/splash_view_controller/login_view_controller.dart';
import 'package:coffee_shop_app/view_model/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewController loginViewController = Get.put(LoginViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset("assets/images/splash_bg.png"),
                ),
              ),
              Positioned(
                  top: 320,
                  left: 30,
                  right: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome\nBack!",
                        style: GoogleFonts.josefinSans(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff230C02)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ReusableContainer(
                          hintText: "Email",
                          controller:
                              loginViewController.textEditingControllerEmail),
                      SizedBox(
                        height: 20,
                      ),
                      ReusableContainer(
                          hintText: "Password",
                          controller: loginViewController
                              .textEditingControllerPassword),
                      const SizedBox(
                        height: 50,
                      ),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            loginViewController.loginpi(context);
                            UserPreferences.getToken();
                          },
                          child: Container(
                            height: 47,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: const Color(0xff230C02)),
                            child: loginViewController.loading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xffEEDDC9),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      "LOGIN",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xffEEDDC9)),
                                    ),
                                  ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 47,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff230C02), width: 2),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Text(
                              "Create an account",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff230C02)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          "Forgot your password",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff230C02),
                              fontSize: 14),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusableContainer extends StatefulWidget {
  final controller;
  var suffix;
  final hintText;
  ReusableContainer(
      {super.key,
      required this.hintText,
      required this.controller,
      this.suffix});

  @override
  State<ReusableContainer> createState() => _ReusableContainerState();
}

class _ReusableContainerState extends State<ReusableContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xff230C02), width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 5, top: 5),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: widget.suffix,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff230C02))),
        ),
      ),
    );
  }
}
