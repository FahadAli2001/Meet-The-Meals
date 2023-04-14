import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WinterDealScreen extends StatelessWidget {
  const WinterDealScreen({super.key});

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
                onPressed: () {},
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
                child: Container(
              color: Colors.pink,
            ))
          ],
        ),
      ),
    );
  }
}
