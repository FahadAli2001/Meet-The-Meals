import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/home/home_controller.dart';
import 'package:meethemeat/utils/utils.dart';

import '../restaurant/restaurant_screen.dart';

// ignore: must_be_immutable
class AllRestaurantScreen extends StatefulWidget {
  const AllRestaurantScreen({super.key});

  @override
  State<AllRestaurantScreen> createState() => _AllRestaurantScreenState();
}

class _AllRestaurantScreenState extends State<AllRestaurantScreen> {
  var btn = Colors.black.obs;

  final RxInt selectedButtonIndex = RxInt(0);

  HomeController homeController = Get.put(HomeController());

  final data = Get.arguments;

  List filterData = [];

  void filterCategory(int cateIndex) {
    for (var element in data['restaurant']) {
      if (element['category'] ==
          homeController.allCategory["categories"][cateIndex]['name']) {
        filterData.add(element);

        setState(() {});
      } else {}
    }
  }

  @override
  void initState() {
    filterCategory(0);

    super.initState();
  }

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
      body: Column(children: [
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
                itemCount: homeController.allCategory['categories'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        selectedButtonIndex.value = index;
                        filterData.clear();

                        filterCategory(index);
                        setState(() {});
                      },
                      child: Center(
                        child: Obx(
                          () => Text(
                            homeController.allCategory['categories'][index]
                                ['name'],
                            style: TextStyle(
                              color: index == selectedButtonIndex.value
                                  ? Colors.orange
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
        (filterData.length > 0)
            ? Expanded(
                child: ListView.builder(
                itemCount: filterData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const RestaurantScreen(), arguments: {
                          "restaurant":
                              homeController.allRestaurant["restaurant"][index]
                        });
                      },
                      child: Container(
                        //color: Colors.amber,
                        width: Get.width,
                        height: Get.height * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    filterData[index]['image'].toString()),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  );
                },
              ))
            : const Center(
                child: Text(
                  'No Restaurants Yet',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              )
      ]),
    ));
  }
}
