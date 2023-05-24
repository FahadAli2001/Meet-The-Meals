import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/login/login_controller.dart';

import 'package:meethemeat/partner/partner_screen.dart';

import '../orders&reordering/order_and_reordering_screen.dart';
import '../utils/utils.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                  child: Text(
                _loginController.name.value,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
            //
            Center(
                child: Text(
              _loginController.email.value,
              style: const TextStyle(
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
                    dialogType: DialogType.question,
                    animType: AnimType.rightSlide,
                    title: 'Logout',
                    desc: 'Are you sure you want to logout?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      _loginController.logOut();
                    },
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
