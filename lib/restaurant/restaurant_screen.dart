import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/utils/utils.dart';

import '../cart/cart_screen.dart';
import 'resturant_detail_screen.dart';

class RestaurantScreen extends StatelessWidget {
  RestaurantScreen({super.key});

  final List menu = [
    'Popular',
    'Top Deals',
    'Burgers',
    'Fries',
    'Family Bags',
    'Drinks',
    'Extras'
  ];

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
                  Get.to(() => const CartScreen());
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
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '20% Off - Dorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu. libero et velit interdum.',
                  style: TextStyle(color: Colors.white),
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
                      'OPTP',
                      style: TextStyle(
                          fontSize: Get.width * 0.05,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '2.4km away | delivery charges 120 Rs',
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
                            'Delivery time 20 min',
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
                  scrollDirection: Axis.horizontal,
                  itemCount: menu.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          menu[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Top Deals',
                        style: TextStyle(
                            fontSize: Get.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: Get.width * 0.45,
                          height: Get.height * 0.2,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/bouncerdeal.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                          width: Get.width * 0.45,
                          height: Get.height * 0.2,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/combo.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Fries',
                        style: TextStyle(
                            fontSize: Get.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  for (var i = 0; i < fries.length; i++) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(fries[i]), fit: BoxFit.fill)),
                      ),
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Burgers',
                        style: TextStyle(
                            fontSize: Get.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  //
                  for (var i = 0; i < burger.length; i++) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(burger[i]),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ],
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
