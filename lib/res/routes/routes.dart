import 'package:coffee_shop_app/res/routes_names/route_names.dart';
import 'package:coffee_shop_app/view/login_view/login_view.dart';
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
          name: RouteNames.loginRoute,
          page: () {
            return const LoginView();
          },
          transition: Transition.leftToRightWithFade)
    ];
  }
}
