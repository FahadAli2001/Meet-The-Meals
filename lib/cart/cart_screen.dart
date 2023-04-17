import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:meethemeat/utils/utils.dart';

import '../checkout/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
                          '\$xxx',
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
                        child: const Text("Confirm payment & address"),
                        onPressed: () {
                          Get.to(() => const CheckOutScreen());
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
            'Cart',
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
        body: Column(
          children: [
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
                  const Expanded(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 2,
                  )),
                  // ignore: prefer_const_constructors
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.check_circle, color: Colors.grey, size: 40),
                      Text(
                        'CheckOut',
                        style: TextStyle(color: Colors.grey),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                width: Get.width,
                height: Get.height * 0.1,
                decoration: const BoxDecoration(
                  color: Color(0xffFFEDE5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: Container(
                    width: Get.width * 0.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/ed.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add more items',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.04),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Orders',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.05),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Shot gun bag',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.04),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    '\$xxx',
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    '\$x',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: Get.width * 0.04),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    '\$x',
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
    );
  }
}
