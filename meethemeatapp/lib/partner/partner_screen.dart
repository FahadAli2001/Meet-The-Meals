import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/restaurant_form.dart/restaurant_form_screen.dart';
import 'package:meethemeat/utils/utils.dart';

import '../riderform/rider_form_screen.dart';

class PartnerScreen extends StatelessWidget {
  const PartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: Get.width * 0.4,
                height: Get.height * 0.2,
                decoration: const BoxDecoration(
                    //color: primaryColor,
                    image: DecorationImage(
                        image: AssetImage('assets/MTMlogo.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            //
            Center(
              child: Text(
                'Rorem ipsum dolor sit amet, consectetur\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t adipiscing elit.',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.04),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/hand.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            //
            Center(
              child: Text(
                'Here how it work',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.04),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    child: const Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Rorem ipsum dolor sit amet, consectetur',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    child: const Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Rorem ipsum dolor sit amet, consectetur',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    child: const Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Rorem ipsum dolor sit amet, consectetur',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    child: const Text(
                      '4',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Rorem ipsum dolor sit amet, consectetur',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RiderFormScreen());
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        width: Get.width / 2.3,
                        height: Get.height * 0.1,
                        color: primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.directions_bike,
                              color: Colors.white,
                            ),
                            Text(
                              'Rider',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RestaurantFromScreen());
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        width: Get.width / 2.3,
                        height: Get.height * 0.1,
                        color: primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.restaurant,
                              color: Colors.white,
                            ),
                            Text(
                              'Restaurant',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
