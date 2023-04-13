import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List categorey = [
    'assets/burger.png',
    'assets/donat.png',
    'assets/pizza.png',
    'assets/meat.png',
    'assets/pasta.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    style: const TextStyle(height: 0.5),
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  )),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.15,
                  decoration: const BoxDecoration(
                      //color: Colors.amberAccent,
                      image: DecorationImage(
                          image: AssetImage('assets/topOffer.png'),
                          fit: BoxFit.fill)),
                ),
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Favorite Restaurants",
                    style: TextStyle(
                        fontSize: Get.height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  //
                  Text(
                    "View all ",
                    style: TextStyle(
                        fontSize: Get.height * 0.018,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              //
              SizedBox(
                width: Get.width,
                height: Get.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: Get.width * 0.88,
                        height: Get.height * 0.2,
                        decoration: const BoxDecoration(
                            //color: Colors.blueAccent,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/optp.png'))),
                      ),
                    );
                  },
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: Get.height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              //
              SizedBox(
                width: Get.width,
                height: Get.height * 0.1,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categorey.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: Get.width * 0.2,
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                          image: DecorationImage(
                              image: AssetImage(categorey[index]),
                              fit: BoxFit.fill),
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
    );
  }
}
