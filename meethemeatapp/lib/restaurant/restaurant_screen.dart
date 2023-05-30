// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/utils/utils.dart';

import 'resturant_detail_screen.dart';

class RestaurantScreen extends StatelessWidget {
  RestaurantScreen({super.key});

  final RxBool isSelected = false.obs;
  final data = Get.arguments;

  final List popular = [
    'assets/nugets.png',
    'assets/fries.png',
    'assets/shotgun.png',
    'assets/fries.png',
  ];

  final List fries = [
    'assets/f1.png',
    'assets/f2.png',
    'assets/f3.png',
  ];

  final List burger = [
    'assets/b1.png',
    'assets/b2.png',
    'assets/b3.png',
    'assets/b4.png',
  ];

  var selectedIndex = 0.obs;

  var btn = Colors.black.obs;

  // checkMenuDetail() {
  //   popularList.clear();
  //   burgerList.clear();

  //   for (var product in data["detail"]["products"]) {
  //     // log(product.toString());
  //     // if (product["popular"] == true) {
  //     //   popularList.add(product.toString());
  //     //   log(popularList.toString());
  //     // } else if (product["status"] == "Burger") {
  //     //   burgerList.add(product.toString());
  //     //   log("----------------------");
  //     //   log(burgerList.toString());
  //     // }
  //     any.add(product);
  //   }
  //   log(any.toString());
  // }

  void checkMenuDetail() {
    var products = data["detail"]["products"];

    List<Map<String, dynamic>> apiData =
        List<Map<String, dynamic>>.from(products);
    //log(apiData.toString());
    groupProductsByStatus(apiData);
  }

  void groupProductsByStatus(List<Map<String, dynamic>> apiData) {
    Map<String, List<Map<String, dynamic>>> groupedProducts = {};

    // Group products based on status
    for (var product in apiData) {
      String status = product['status'];

      if (!groupedProducts.containsKey(status)) {
        groupedProducts[status] = [];
      }

      groupedProducts[status]!.add(product);
    }

    for (var status in groupedProducts.keys) {
      log('Products with status $status:');
      for (var product in groupedProducts[status]!) {
        log('Name: ${product['pname']}');
        log('Image: ${product['pimage']}');
        log('Price: ${product['pprice']}');
        log('--------------');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                  // Get.to(() => const CartScreen());
                  checkMenuDetail();
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
              height: Get.height * 0.15,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bur.png'), fit: BoxFit.fill)),
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.1,
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  data["detail"]["description"],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: Get.width,
              height: Get.height * 0.13,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["detail"]["name"],
                      style: TextStyle(
                          fontSize: Get.width * 0.05,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '2.4km away | delivery charges ${data["detail"]["dcharges"].toString()} Rs',
                      style: TextStyle(
                          fontSize: Get.width * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        for (var i = 0; i < 5; i++) ...[
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        ]
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled_outlined,
                            color: primaryColor),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Delivery time ${data["detail"]["dtime"]} min',
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //
            SizedBox(
              width: Get.width,
              height: Get.height * 0.08,
              child: Card(
                elevation: 10,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data["detail"]["menu"].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Obx(
                        () => Center(
                          child: GestureDetector(
                            onTap: () {
                              selectedIndex.value = index;
                              //log(data["detail"].toString());
                            },
                            child: Text(
                              data["detail"]["menu"][index]["menu_name"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex.value == index
                                      ? primaryColor
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // ------------ After Menu row -------------
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Popular',
                        style: TextStyle(
                            fontSize: Get.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  //
                  SizedBox(
                    width: Get.width,
                    height: Get.height * 0.46,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: popular.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => ResturantDetailScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(popular[index]),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )),

            //
          ],
        ),
      ),
    );
  }
}
