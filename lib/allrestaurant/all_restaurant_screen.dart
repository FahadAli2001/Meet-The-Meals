import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/utils/utils.dart';

// ignore: must_be_immutable
class AllRestaurantScreen extends StatelessWidget {
  AllRestaurantScreen({super.key});

  List options = [
    'Burger',
    'Pizza',
    'Steak',
    'Desert',
    'Chinese',
    'Sandwiches',
    'Bbq',
    'Deserts',
    'Extras'
  ];

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
        title: const Text(
          'All Restaurants',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 3,
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
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        Container(
          width: Get.width,
          height: Get.height * 0.1,
          color: primaryColor,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                style: const TextStyle(height: 0.5),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )),
        ),
        SizedBox(
          width: Get.width,
          height: Get.height * 0.08,
          child: Card(
            elevation: 10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      options[index],
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        for (var i = 0; i < resturants.length; i++) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              //color: Colors.amber,
              width: Get.width,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(resturants[i]), fit: BoxFit.fill)),
            ),
          ),
        ]
      ]),
    ));
  }
}
