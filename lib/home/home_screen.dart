import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/allrestaurant/all_restaurant_screen.dart';
import 'package:meethemeat/cart/cart_screen.dart';
import 'package:meethemeat/restaurant/restaurant_screen.dart';
import 'package:meethemeat/winterdeal/winter_deal_screen.dart';

import '../customs_widget/drawer.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List categorey = [
    'assets/burger.png',
    'assets/donat.png',
    'assets/pizza.png',
    'assets/meat.png',
    'assets/pasta.png',
  ];

  List resturants = [
    'assets/kfc.png',
    'assets/mac.png',
    'assets/optp.png',
    'assets/subway.png',
  ];

  List dailyDeals = [
    'assets/dd1.png',
    'assets/dd2.png',
    'assets/dd3.png',
  ];

  List seasonalDeal = [
    'assets/sd.png',
    'assets/sd2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        elevation: 3,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
              onPressed: () {
                Get.to(() => const CartScreen());
              },
              icon: const Icon(Icons.shopping_bag_outlined),
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  style: const TextStyle(height: 0.5),
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                )),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: Get.width,
                height: Get.height * 0.2,
                decoration: const BoxDecoration(
                    //  / color: Colors.amberAccent,
                    image: DecorationImage(
                        image: AssetImage('assets/topOffer.png'),
                        fit: BoxFit.fitWidth)),
              ),
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Favorite Restaurants",
                  style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                //
                GestureDetector(
                  onTap: () {
                    Get.to(() => AllRestaurantScreen());
                  },
                  child: Text(
                    "View all ",
                    style: TextStyle(
                        fontSize: Get.height * 0.018,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
            //
            SizedBox(
              width: Get.width,
              height: Get.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: resturants.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 2) {
                          Get.to(() => RestaurantScreen());
                        } else {}
                      },
                      child: Container(
                        width: Get.width * 0.88,
                        height: Get.height * 0.2,
                        decoration: BoxDecoration(
                            //color: Colors.blueAccent,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(resturants[index]))),
                      ),
                    ),
                  );
                },
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            //
            SizedBox(
              width: Get.width,
              height: Get.height * 0.1,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categorey.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: Get.width * 0.2,
                      height: Get.height * 0.1,
                      decoration: BoxDecoration(
                        //color: Colors.blue,
                        image: DecorationImage(
                            image: AssetImage(categorey[index]),
                            fit: BoxFit.fill),
                      ),
                    ),
                  );
                },
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "All Restaurants",
                  style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            //
            //
            SizedBox(
              width: Get.width,
              height: Get.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: resturants.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: Get.width * 0.88,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          //color: Colors.blueAccent,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(resturants[index]))),
                    ),
                  );
                },
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Daily Deals",
                  style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            //
            SizedBox(
              width: Get.width,
              height: Get.height * 0.15,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: dailyDeals.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: Get.width * 0.4,
                      height: Get.height * 0.15,
                      decoration: BoxDecoration(
                        //color: Colors.blue,
                        image: DecorationImage(
                            image: AssetImage(dailyDeals[index]),
                            fit: BoxFit.fill),
                      ),
                    ),
                  );
                },
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Seasonal Deals",
                  style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            //
            SizedBox(
              width: Get.width,
              height: Get.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: seasonalDeal.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 1) {
                          Get.to(() => WinterDealScreen());
                        } else {}
                      },
                      child: Container(
                        width: Get.width * 0.88,
                        height: Get.height * 0.2,
                        decoration: BoxDecoration(
                            //color: Colors.blueAccent,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(seasonalDeal[index]))),
                      ),
                    ),
                  );
                },
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
