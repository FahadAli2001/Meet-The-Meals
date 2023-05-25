import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/restaurant/resturant_detail_screen.dart';
import 'package:meethemeat/utils/utils.dart';

class OrderAndReorderingScreen extends StatelessWidget {
  const OrderAndReorderingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Orders & Reordering',
            style: TextStyle(color: Colors.black),
          ),
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
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined),
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Past Orders',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: Get.width * 0.05),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height * 0.2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  image: DecorationImage(
                                      image: AssetImage('assets/shotgun.png'))),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Shot Gun Bag',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Get.width * 0.045,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.3,
                            ),
                            Text(
                              '\$xxx',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: Get.width * 0.045,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width,
                          child: CupertinoButton(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor,
                              child: const Text("Select to re-order"),
                              onPressed: () {
                                Get.to(() => ResturantDetailScreen());
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
