import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/delivery/delivery_screen.dart';
import 'package:meethemeat/restaurant/restaurant_screen_controller.dart';

import '../utils/utils.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({super.key});

  final RestaurantScreenController restaurantScreenController =
      Get.put(RestaurantScreenController());

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          width: Get.width,
          height: Get.height * 0.13,
          child: Card(
            //  color: Colors.amber,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.04),
                        ),
                        Text(
                          '\$ ${restaurantScreenController.totalValue.value.toString()}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.04),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor,
                        child: const Text("Place Order"),
                        onPressed: () {
                        //  Get.to(() => const DeliveryScreen());
                        
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Checkout',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          SizedBox(
            // color: Colors.pink,
            width: Get.width,
            height: Get.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Divider(
                  color: primaryColor,
                  thickness: 2,
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: primaryColor,
                      size: 40,
                    ),
                    const Text(
                      'Menu',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Expanded(
                    child: Divider(
                  color: primaryColor,
                  thickness: 2,
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.check_circle, color: primaryColor, size: 40),
                    const Text(
                      'Cart',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Expanded(
                    child: Divider(
                  color: primaryColor,
                  thickness: 2,
                )),
                // ignore: prefer_const_constructors
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.check_circle, color: primaryColor, size: 40),
                    const Text(
                      'CheckOut',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                )),
              ],
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.3,
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Row(
                        children: [
                          Icon(Icons.pin_drop, color: primaryColor),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Delivery Address',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.4,
                          ),
                          Expanded(
                              child: Icon(Icons.edit, color: primaryColor)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.23,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/map.PNG'),
                                fit: BoxFit.fill)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.1,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.payment,
                            color: primaryColor,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Payment Method',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.4,
                          ),
                          Icon(Icons.edit, color: primaryColor)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'COD',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$ ${restaurantScreenController.totalValue.value.toString()}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.2,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.discount,
                            color: primaryColor,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Voucher Code',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                        child: TextField(
                          style: const TextStyle(height: 0.5),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'Enter Code Here',
                              suffix: CupertinoButton(
                                color: primaryColor,
                                child: const Text('Apply'),
                                onPressed: () {},
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SizedBox(
              width: Get.width,
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: primaryColor,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Order Summary',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Get.width * 0.04),
                          ),
                          Text(
                            '\$ ${restaurantScreenController.subTotal.value}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Get.width * 0.04),
                          ),
                        ],
                      ),
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: Get.width * 0.04),
                          ),
                          Text(
                            '\$ ${data['restaurant']['dcharges']}',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: Get.width * 0.04),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PlatForm Fee',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: Get.width * 0.04),
                          ),
                          Text(
                            '\$ ${restaurantScreenController.platformFee}',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: Get.width * 0.04),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
