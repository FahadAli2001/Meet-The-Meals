import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});
  List resturants = [
    'assets/kfc.png',
    'assets/mac.png',
    'assets/optp.png',
    'assets/subway.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wishlist',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 3,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.menu),
        //   color: Colors.black,
        // ),
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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: resturants.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Container(
              //color: Colors.amber,
              width: Get.width,
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(resturants[index]), fit: BoxFit.fill)),
            ),
          );
        },
      ),
    );
  }
}
