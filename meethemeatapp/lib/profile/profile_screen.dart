import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/login/login_controller.dart';
import 'package:meethemeat/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 3,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                color: Colors.grey.shade300,
                width: Get.width,
                child: ListTile(
                  title: const Text('Name'),
                  subtitle: Text(
                    _loginController.name.value,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: primaryColor,
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  color: Colors.grey.shade300,
                  width: Get.width,
                  child: ListTile(
                    title: const Text('Email'),
                    subtitle: Text(
                      _loginController.email.value,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              //
              Container(
                color: Colors.grey.shade300,
                width: Get.width,
                child: ListTile(
                  title: const Text('Phone Number'),
                  subtitle: Text(
                    _loginController.phoneNumber.value,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: primaryColor,
                  ),
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
