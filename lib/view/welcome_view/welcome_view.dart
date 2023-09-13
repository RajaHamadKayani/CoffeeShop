import 'package:coffee_shop_app/view_model/controllers/splash_view_controller/login_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final LoginViewController loginViewController =
      Get.find(); // Use Get.find to get the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      height: 160,
                    ),
                    InkWell(
                      onTap: () {
                        loginViewController.goToLoginView(context);
                      },
                      child: Container(
                        height: 47,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color(0xff230C02)),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffEEDDC9)),
                          ),
                        ),
                      ),
                    ),
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
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        "Forgot your password",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff230C02),
                            fontSize: 14),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
