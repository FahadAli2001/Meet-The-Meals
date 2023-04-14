import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/utils/utils.dart';

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

  List resturants = [
    'assets/kfc.png',
    'assets/mac.png',
    'assets/optp.png',
    'assets/subway.png',
  ];

  List dailyDeals = [
    'assets/dd1.png',
    'assets/dd2.png',
    'assets/dd3.png',
  ];

  List seasonalDeal = [
    'assets/sd.png',
    'assets/sd2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
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
                itemCount: resturants.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: Get.width * 0.88,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          //color: Colors.blueAccent,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(resturants[index]))),
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
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "All Restaurants",
                  style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            //
            //
            SizedBox(
              width: Get.width,
              height: Get.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: resturants.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: Get.width * 0.88,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          //color: Colors.blueAccent,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(resturants[index]))),
                    ),
                  );
                },
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Daily Deals",
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
              height: Get.height * 0.15,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: dailyDeals.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: Get.width * 0.4,
                      height: Get.height * 0.15,
                      decoration: BoxDecoration(
                        //color: Colors.blue,
                        image: DecorationImage(
                            image: AssetImage(dailyDeals[index]),
                            fit: BoxFit.fill),
                      ),
                    ),
                  );
                },
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Seasonal Deals",
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
              height: Get.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: seasonalDeal.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: Get.width * 0.88,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          //color: Colors.blueAccent,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(seasonalDeal[index]))),
                    ),
                  );
                },
              ),
            ),
            //
          ],
        ),
      ),
    );
  }

  Widget drawer(BuildContext context) {
    return Drawer(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.14,
              decoration: const BoxDecoration(
                  //color: Colors.amber,
                  image: DecorationImage(
                      image: AssetImage('assets/Rectangle 1.png'),
                      fit: BoxFit.fill)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 70,
                    // color: Colors.white,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/mtm.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ),
            //
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Center(
                  child: Text(
                "Meat To Meal",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
            //
            const Center(
                child: Text(
              "meatomeal@gmail.com",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            )),
            //
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: Get.width,
                child: const Divider(
                  height: 0.5,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: ListTile(
                title: const Text("Profile"),
                iconColor: primaryColor,
                leading: const Icon(Icons.person),
              ),
            ),

            SizedBox(
              width: Get.width,
              child: ListTile(
                title: const Text("Address"),
                iconColor: primaryColor,
                leading: const Icon(Icons.pin_drop),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: ListTile(
                title: const Text("Orders & reordering"),
                iconColor: primaryColor,
                leading: const Icon(Icons.book),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: ListTile(
                title: const Text("Settings"),
                iconColor: primaryColor,
                leading: const Icon(Icons.settings),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: ListTile(
                title: const Text("Help Center"),
                iconColor: primaryColor,
                leading: const Icon(Icons.question_mark),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: Get.width,
                child: const Divider(
                  height: 0.5,
                  color: Colors.black,
                ),
              ),
            ),
            const Text(
              "Terms & conditions/Policy",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: Get.width,
              child: ListTile(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.rightSlide,
                    title: 'Logout',
                    desc: 'Are you sure you want to logout?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
                title: const Text("Logout"),
                iconColor: primaryColor,
                leading: const Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
