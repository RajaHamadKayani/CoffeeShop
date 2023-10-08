import 'package:coffee_shop_app/res/routes_names/route_names.dart';
import 'package:coffee_shop_app/utils/utils.dart';
import 'package:coffee_shop_app/view/cart_view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewController extends GetxController {
  RxList<CartItem> items = <CartItem>[].obs;
  void addToCart(CartItem cartItem) {
    final existingItem = items.firstWhere(
      (item) => item.title == cartItem.title,
      orElse: () => null!,
    );

    if (existingItem != null) {
      existingItem.quantity += 1; // Increase quantity if item already exists
    } else {
      items.add(cartItem);
    }
  }

  void removeFromCart(CartItem cartItem) {
    final existingItem = items.firstWhere(
      (item) => item.title == cartItem.title,
      orElse: () => null!,
    );

    if (existingItem != null) {
      if (existingItem.quantity > 1) {
        existingItem.quantity -= 1; // Decrease quantity if > 1
      } else {
        items.remove(existingItem); // Remove item if quantity is 1
      }
    }
  }

  void navToCartView(BuildContext context) {
    Get.toNamed(RouteNames.cartRoute, arguments: [items]);
  }
}
