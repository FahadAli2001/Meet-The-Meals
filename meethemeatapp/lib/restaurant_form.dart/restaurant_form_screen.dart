import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/dashboard/dashboard.dart';

class RestaurantFromScreen extends StatelessWidget {
  const RestaurantFromScreen({super.key});

  get primaryColor => null;

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
                    color: const Color(0xffFF5607),
                    child: const Text("Submit"),
                    onPressed: () {
                      Get.to(() => const Dashboard());
                    }),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Business Details',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.05),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  'Business name',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.04),
                ),
              ),
              //
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: const TextStyle(height: 0.5),
                  decoration: InputDecoration(
                      hintText: "Your business name",
                      labelText: "Business name",
                      focusColor: primaryColor,
                      border: const OutlineInputBorder()),
                ),
              ),
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  'Business Type',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.04),
                ),
              ),
              //
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: const TextStyle(height: 0.5),
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      hintText: "Enter Buisness type",
                      labelText: "Business type",
                      focusColor: primaryColor,
                      border: const OutlineInputBorder()),
                ),
              ),
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  'Category',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.04),
                ),
              ),
              //
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: const TextStyle(height: 0.5),
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      hintText: "Enter value",
                      labelText: "Category",
                      focusColor: primaryColor,
                      border: const OutlineInputBorder()),
                ),
              ),
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  'Restaurant address',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.04),
                ),
              ),
              //
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: const TextStyle(height: 0.5),
                  decoration: InputDecoration(
                      hintText: "Enter restaurant address",
                      labelText: "Restaurant address",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  'Email Address',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.04),
                ),
              ),
              //
              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: const TextStyle(height: 0.5),
                  decoration: InputDecoration(
                      hintText: "Enter your email address",
                      labelText: "Email Address",
                      focusColor: primaryColor,
                      border: const OutlineInputBorder()),
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
