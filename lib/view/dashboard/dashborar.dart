import 'package:coffee_shop_app/view/favorites_screen/favorites_screen.dart';
import 'package:coffee_shop_app/view/home_view/home_view.dart';
import 'package:coffee_shop_app/view/profile_screen/profile_screen.dart';
import 'package:coffee_shop_app/view/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final controller = PersistentTabController(initialIndex: 0);
  List<Widget> screens() {
    return [
      const HomeView(),
      const ShoppingCartScreen(),
      const FavoritesScreen(),
      const ProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.home,
            color: Color(0xff230C02),
          ),
          inactiveIcon: const Icon(
            Icons.home_outlined,
            color: Color(0xff230C02),
          )),
      PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.shopping_cart,
            color: Color(0xff230C02),
          ),
          inactiveIcon: const Icon(
            Icons.shopping_cart_outlined,
            color: Color(0xff230C02),
          )),
      PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.favorite,
            color: Color(0xff230C02),
          ),
          inactiveIcon: const Icon(
            Icons.favorite_outline,
            color: Color(0xff230C02),
          )),
      PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.person,
            color: Color(0xff230C02),
          ),
          inactiveIcon: const Icon(
            Icons.person_outline,
            color: Color(0xff230C02),
          ))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 72,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30))),
      screens: screens(),
      items: navBarItems(),
      controller: controller,
      backgroundColor: const Color(0xffEEDCC6),
    );
  }
}
