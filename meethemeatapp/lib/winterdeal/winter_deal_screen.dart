import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/cart/cart_screen.dart';

// ignore: must_be_immutable
class WinterDealScreen extends StatelessWidget {
  WinterDealScreen({super.key});

  List resturants = [
    'assets/kfc.png',
    'assets/mac.png',
    'assets/optp.png',
    'assets/subway.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                onPressed: () {
                  Get.to(() => CartScreen());
                },
                icon: const Icon(Icons.shopping_bag_outlined),
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/seasonal.png'),
                      fit: BoxFit.fill)),
            ),
            Expanded(
                child: SizedBox(
              // color: Colors.pink,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: resturants.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      width: Get.width,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage(resturants[index]))),
                    ),
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
