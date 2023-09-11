import 'package:coffee_shop_app/res/routes/routes.dart';
import 'package:coffee_shop_app/view/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      getPages: Routes.getRoutes(),
    );
  }
}
