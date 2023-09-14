import 'package:coffee_shop_app/res/constants/constants.dart';
import 'package:coffee_shop_app/view_model/controllers/cart_view_controller/cart_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CartView extends StatefulWidget {
  final List<CartItem> items;

  CartView({super.key, required this.items});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  bool isCartEmpty = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isCartEmpty = cartViewController.items.isEmpty;
    animationController = AnimationController(vsync: this);
  }

  CartViewController cartViewController = Get.find();
  @override
  Widget build(BuildContext context) {
    final coffeeItems = cartViewController.items;

    print("Length of the carted items: ${cartViewController.items.length}");
    return Scaffold(
      backgroundColor: const Color(0xffFFF5E9),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Cart",
                    style: GoogleFonts.josefinSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff230C02)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("assets/images/cart_icon.png"),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Obx(() {
                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xff230C02)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 34, right: 34),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: coffeeItems.length,
                        itemBuilder: (context, index) {
                          final cartedItem = coffeeItems[index];
                          final title = cartedItem.title;
                          final subtitle = cartedItem.subtitle;
                          final image = cartedItem.image;
                          return Padding(
                            padding: EdgeInsets.only(bottom: 27),
                            child: ClipRRect(
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
                                          subtitle,
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
                                                cartViewController
                                                    .removeFromCart(cartedItem);
                                                print(
                                                    "Length after removing specific item: ${cartViewController.items.length}");
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10, left: 5),
                                                      child: Text(
                                                        "Remove",
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
                                                      padding: EdgeInsets.only(
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
                                        child: Image.asset(image),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String title;
  final String subtitle;
  final String image;

  CartItem({required this.title, required this.subtitle, required this.image});
}
