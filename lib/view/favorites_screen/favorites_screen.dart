import 'package:coffee_shop_app/view_model/controllers/favorite_screen_controller/favorite_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FavoritesScreen extends StatefulWidget {
  var title;
  var subtitle;
  var image;
  FavoritesScreen(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.title});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  FavoriteScreenController favoriteScreenController =
      Get.put(FavoriteScreenController());
  var argument = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print("Rebuild getx");
    return Scaffold(
      backgroundColor: const Color(0xffEEDCC6),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 28),
                child: Row(
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
              ),
              const SizedBox(
                height: 21,
              ),
              Expanded(
                  child: Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image(
                            image: AssetImage(Get.arguments[2].toString())),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 450,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Color(0xff3B2C26)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 40, left: 30),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(
                                  Get.arguments[0].toString(),
                                  style: GoogleFonts.josefinSans(
                                      color: Color(0xffEEDCC6),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(() {
                                  return IconButton(
                                      onPressed: () {
                                        favoriteScreenController.isLoading();
                                      },
                                      icon:
                                          favoriteScreenController.loading.value
                                              ? const Icon(
                                                  Icons.favorite,
                                                  color: Color(0xffFFF5E9),
                                                )
                                              : const Icon(
                                                  Icons.favorite_outline,
                                                  color: Color(0xffFFF5E9),
                                                ));
                                })
                              ]),
                              const SizedBox(
                                height: 21,
                              ),
                              Text(
                                Get.arguments[1].toString(),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffEEDCC6),
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Complex, yet smooth flavour made to order",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Color(0xffEEDCC6)),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ))
            ]),
      ),
    );
  }
}
