import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/home/home_controller.dart';
import 'package:meethemeat/restaurant/restaurant_screen.dart';

class CategoryRestaurantScreen extends StatelessWidget {
  CategoryRestaurantScreen({super.key});

  final data = Get.arguments;

  final HomeController homeController = Get.put(HomeController());

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
            ),
            body: (data['rest_list'].length > 0)
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: ListView.builder(
                      itemCount: data['rest_list'].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              //log(data['rest_list'][index]['products'].toString());
                              Get.to(() => const RestaurantScreen(),
                                  arguments: {
                                    "restaurant": homeController
                                        .allRestaurant["restaurant"][index]
                                  });
                            },
                            child: Container(
                              width: Get.width,
                              height: Get.height * 0.2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          data['rest_list'][index]['image']))),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text(
                      'No Restaurants Yet',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )));
  }
}
