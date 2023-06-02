// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/utils/utils.dart';

import 'resturant_detail_screen.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final RxBool isSelected = false.obs;

  final data = Get.arguments;

  var selectedIndex = 0.obs;

  var btn = Colors.black.obs;

  List filterData = [];

  void getFilterProductData(int menuIndex) {
    data['restaurant']['products'].forEach((element) {
      if (data['restaurant']['menu'][menuIndex]['menu_name'] ==
          element['status']) {
        filterData.add(element);

        setState(() {});
      } else {}
    });
  }

  @override
  void initState() {
    getFilterProductData(0);
    super.initState();
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
                  data["restaurant"]["description"],
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
                      data["restaurant"]["name"],
                      style: TextStyle(
                          fontSize: Get.width * 0.05,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '2.4km away | delivery charges ${data["restaurant"]["dcharges"].toString()} Rs',
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
                            'Delivery time ${data["restaurant"]["dtime"]} min',
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
            //------------------------------
            SizedBox(
              width: Get.width,
              height: Get.height * 0.08,
              child: Card(
                elevation: 10,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data?["restaurant"]?["menu"]?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            selectedIndex.value = index;
                            filterData.clear();
                            getFilterProductData(selectedIndex.value);
                          },
                          child: Text(
                            data['restaurant']['menu'][index]['menu_name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedIndex.value == index
                                    ? primaryColor
                                    : Colors.black),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height * 0.46,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: filterData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => ResturantDetailScreen(), arguments: {
                                'restaurant': data['restaurant'],
                                'restaurant_detail': filterData[index]
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      filterData[index]['pimage'].toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Text(
                                      filterData[index]['pname'].toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Text(
                                      filterData[index]['pprice'].toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
