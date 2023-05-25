import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/utils/utils.dart';

import 'rider_screen.dart';

class RiderFormScreen extends StatelessWidget {
  const RiderFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: SizedBox(
        width: Get.width,
        height: Get.height * 0.1,
        child: Card(
          //  color: Colors.amber,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: Get.width,
              child: CupertinoButton(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryColor,
                  child: const Text("Submit"),
                  onPressed: () {
                    Get.to(() => const RiderScreen());
                  }),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Container(
                width: Get.width * 0.5,
                height: Get.height * 0.2,
                decoration: const BoxDecoration(
                    //color: primaryColor,
                    image: DecorationImage(
                        image: AssetImage('assets/MTMlogo.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            //
            const Center(
              child: Text(
                'Fill in the form below to become our \n\t partner and increase your revenue!',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Ride Details',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.05),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                'Ride Model',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.04),
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                style: const TextStyle(height: 0.5),
                decoration: InputDecoration(
                    hintText: "Enter Ride model",
                    labelText: "Ride model",
                    focusColor: primaryColor,
                    border: const OutlineInputBorder()),
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                'Ride Type',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.04),
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                style: const TextStyle(height: 0.5),
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                    hintText: "Enter type",
                    labelText: "Ride type",
                    focusColor: primaryColor,
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                'Driving License No',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.04),
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                style: const TextStyle(height: 0.5),
                decoration: InputDecoration(
                    hintText: "*** *** *** ***",
                    labelText: "License No",
                    focusColor: primaryColor,
                    border: const OutlineInputBorder()),
              ),
            ),
            Divider(
              thickness: 10,
              color: Colors.grey.shade300,
            ),
            //

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Personal Details',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.05),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                'First Name',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.04),
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                style: const TextStyle(height: 0.5),
                decoration: InputDecoration(
                    hintText: "Your first name",
                    labelText: "First Name",
                    focusColor: primaryColor,
                    border: const OutlineInputBorder()),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                'Last Name',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.04),
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                style: const TextStyle(height: 0.5),
                decoration: InputDecoration(
                    hintText: "Your last name",
                    labelText: "Last Name",
                    focusColor: primaryColor,
                    border: const OutlineInputBorder()),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                'Contact Number',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.04),
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                style: const TextStyle(height: 0.5),
                decoration: InputDecoration(
                    hintText: "+92 *** *** *** *",
                    labelText: "Contact",
                    focusColor: primaryColor,
                    border: const OutlineInputBorder()),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                'CNIC Number',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.04),
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                style: const TextStyle(height: 0.5),
                decoration: InputDecoration(
                    hintText: "*****-****-***-*",
                    labelText: "Cnic",
                    focusColor: primaryColor,
                    border: const OutlineInputBorder()),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
