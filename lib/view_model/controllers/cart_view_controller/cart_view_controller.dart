import 'package:coffee_shop_app/res/routes_names/route_names.dart';
import 'package:coffee_shop_app/utils/utils.dart';
import 'package:coffee_shop_app/view/cart_view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewController extends GetxController {
  RxList<CartItem> items = <CartItem>[].obs;
  void addToCart(CartItem cartItem) {
    if (!items.contains(cartItem)) {
      items.add(cartItem);
      Utils.toastMessage("Coffee Shop", "Item added to cart successfully!!!");
    }
  }

  void removeFromCart(CartItem cartItem) {
    if (items.contains(cartItem)) {
      items.remove(cartItem);
      Utils.toastMessage(
          "Coffee Shop", "Item removed from cart successfully!!!");
    }
  }

  void navToCartView(BuildContext context) {
    Get.toNamed(RouteNames.cartRoute, arguments: [items]);
  }
}
