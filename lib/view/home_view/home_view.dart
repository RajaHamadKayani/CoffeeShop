import 'package:coffee_shop_app/res/constants/constants.dart';
import 'package:coffee_shop_app/res/routes_names/route_names.dart';
import 'package:coffee_shop_app/view/cart_view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CartItem> items = [];
  void addToCart(CartItem item) {
    if (!items.contains(item)) {
      items.add(item);
      Utils.toastMessage("Cart", "Items Add to cart successfully!!!");
    }
  }

  void removeItem(CartItem item) {
    if (items.isNotEmpty) {
      items.remove(item);
    }
  }

  void navToCartScreen(BuildContext context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => CartView(items: items)));
  }

  bool onTap = false;
  String initial = "Popular";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff230C02),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(RouteNames.cartRoute);
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Color(0xffFFF5E9),
              ))
        ],
        title: Text(
          "Coffee Shop",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: const Color(0xffFFF5E9)),
        ),
      ),
      backgroundColor: const Color(0xffEEDCC6),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/searh_icon.png",
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Good day, Selenay",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff230C02)),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Image.asset("assets/images/notification.png"),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              color: Color(0xff230C02),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Text(
                    "What would you like\n to drink today?",
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: const Color(0xff230C02)),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Container(
                    height: 36,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: Constants.categories.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 23),
                            child: ClipRRect(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    initial = Constants.categories[index];
                                  });
                                },
                                child: Container(
                                  height: double.infinity,
                                  width: 73,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(68),
                                      color:
                                          initial == Constants.categories[index]
                                              ? const Color(0xff230C02)
                                              : const Color(0xffEEDCC6)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            Constants.categories[index],
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                                color: initial ==
                                                        Constants
                                                            .categories[index]
                                                    ? const Color(0xffffffff)
                                                    : const Color(0xff230C02)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xff230C02)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 31, vertical: 31),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: Constants.allCoffeesTitle.length,
                        itemBuilder: (context, index) {
                          final image = Constants.images[index].toString();
                          final title = Constants.allCoffeesTitle[index];
                          final subTitle = Constants.allCoffeesSubtitle[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 27),
                            child: ClipRRect(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(RouteNames.favourite, arguments: [
                                    Constants.allCoffeesTitle[index],
                                    Constants.allCoffeesSubtitle[index],
                                    Constants.images[index]
                                  ]);
                                },
                                child: Container(
                                  height: 104,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffFFF5E9)),
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 18),
                                      child: Text(
                                        title,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff230C02)),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 18),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            subTitle,
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff230C02)),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  CartItem cartItem = CartItem(
                                                      title: title,
                                                      subtitle: subTitle,
                                                      image: image);
                                                  addToCart(cartItem);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 130,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: const Color(
                                                          0xff230C02)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10,
                                                                left: 5),
                                                        child: Text(
                                                          "Add to Cart",
                                                          style: GoogleFonts
                                                              .josefinSans(
                                                                  color: const Color(
                                                                      0xffEEDCC6)),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5),
                                                        child: Icon(
                                                          Icons.shopping_cart,
                                                          color:
                                                              Color(0xffEEDCC6),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    trailing: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Container(
                                        height: double.infinity,
                                        width: 70,
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child:
                                              Image(image: AssetImage(image)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
