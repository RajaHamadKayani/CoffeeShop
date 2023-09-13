import 'package:coffee_shop_app/res/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool onTap = false;
  String initial = "Popular";
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
                                          padding: EdgeInsets.only(left: 10),
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
                        itemCount: Constants.images.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 27),
                            child: ClipRRect(
                              child: InkWell(
                                onTap: () {},
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
                                        Constants.allCoffeesTitle[index],
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff230C02)),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 18),
                                      child: Text(
                                        Constants.allCoffeesSubtitle[index],
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff230C02)),
                                      ),
                                    ),
                                    trailing: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Container(
                                        height: double.infinity,
                                        width: 70,
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image(
                                              image: AssetImage(Constants
                                                  .images[index]
                                                  .toString())),
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
