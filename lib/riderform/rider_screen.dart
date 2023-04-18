import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:meethemeat/dashboard/dashboard.dart';

import '../orders&reordering/order_and_reordering_screen.dart';
import '../partner/partner_screen.dart';
import '../utils/utils.dart';

class RiderScreen extends StatelessWidget {
  const RiderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(context),
        appBar: AppBar(
          elevation: 3,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Order',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Get.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Decline',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: Get.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.amberAccent,
                      image: const DecorationImage(
                          image: AssetImage('assets/map.PNG'),
                          fit: BoxFit.fill)),
                ),
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: primaryColor)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'CASH : \$XXX',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Get.width * 0.04,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        color: primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'TIME : 10 MIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.width * 0.04,
                        ),
                      ),
                    ),
                  ),
                  //
                ],
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Delivery Details',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.04,
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Icon(FontAwesomeIcons.building, color: primaryColor),
                  Text(
                    'Pakistan , karachi sindh',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Get.width * 0.04,
                    ),
                  ),
                ],
              ),
              //
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_downward_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              //
              Row(
                children: [
                  Icon(FontAwesomeIcons.person, color: primaryColor),
                  Text(
                    'Pakistan , karachi sindh',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Get.width * 0.04,
                    ),
                  ),
                ],
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: SizedBox(
                  width: Get.width * 0.6,
                  height: Get.height * 0.06,
                  child: CupertinoButton(
                    color: Colors.green,
                    child: const Text('Accept'),
                    onPressed: () {
                      Get.offAll(() => const Dashboard());
                    },
                  ),
                ),
              )
            ],
          ),
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
                onTap: () {
                  Get.to(() => const OrderAndReorderingScreen());
                },
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
            SizedBox(
              width: Get.width,
              child: ListTile(
                onTap: () {
                  Get.to(() => const PartnerScreen());
                },
                title: const Text("Become a partner"),
                iconColor: primaryColor,
                leading: const Icon(Icons.handshake_sharp),
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
