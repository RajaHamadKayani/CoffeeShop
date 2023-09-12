import 'package:coffee_shop_app/res/routes_names/route_names.dart';
import 'package:coffee_shop_app/view/dashboard/dashborar.dart';
import 'package:coffee_shop_app/view/home_view/home_view.dart';
import 'package:coffee_shop_app/view/login_view/login_view.dart';
import 'package:coffee_shop_app/view/welcome_view/welcome_view.dart';
import 'package:coffee_shop_app/view/splash_view/splash_view.dart';
import 'package:get/get.dart';

class Routes {
  static getRoutes() {
    return [
      GetPage(
          name: RouteNames.splashRoute,
          page: () {
            return const SplashView();
          },
          transition: Transition.leftToRightWithFade),
      GetPage(
          name: RouteNames.welcomeRoute,
          page: () {
            return const WelcomeView();
          },
          transition: Transition.leftToRightWithFade),
      GetPage(
          name: RouteNames.loginRoute,
          page: () {
            return const LoginView();
          },
          transition: Transition.leftToRightWithFade),
      GetPage(
          name: RouteNames.homeRoute,
          page: () {
            return const HomeView();
          },
          transition: Transition.leftToRightWithFade),
      GetPage(
          name: RouteNames.dashborad,
          page: () {
            return const DashBoard();
          },
          transition: Transition.leftToRightWithFade)
    ];
  }
}
