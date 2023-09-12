import 'package:coffee_shop_app/view_model/controllers/splash_view_controller/login_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  LoginViewController loginViewController = Get.put(LoginViewController());
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: SingleChildScrollView(
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
                    child: Image.asset("assets/images/splash_bg.png")),
              ),
              Positioned(
                  top: 380,
                  right: 50,
                  left: 50,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 36,
                          width: 263,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "COFFEE SHOP",
                              style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff230C02)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Enjoy the drink coffee",
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color(0xff230C02)),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        InkWell(
                          onTap: () {
                            loginViewController.goToNext(context);
                          },
                          child: Container(
                            height: 47,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: const Color(0xff230C02)),
                            child: Center(
                              child: Text(
                                "SHOP NOW",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffEEDDC9)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
