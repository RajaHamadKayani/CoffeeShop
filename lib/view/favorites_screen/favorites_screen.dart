import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
  var argument = Get.arguments;
  @override
  Widget build(BuildContext context) {
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
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 288,
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image(
                            image: AssetImage(Get.arguments[2].toString()))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
