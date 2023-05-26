import 'dart:developer';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/home/home_controller.dart';

import 'package:meethemeat/home/home_screen.dart';
import 'package:meethemeat/login/login_controller.dart';
import 'package:meethemeat/profile/profile_screen.dart';
import 'package:meethemeat/utils/utils.dart';
import 'package:meethemeat/wishlist/wishlist_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedPos = 1;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.favorite,
      "WishList",
      primaryColor,
      labelStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.home,
      "Home",
      primaryColor,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.person,
      "Profile",
      primaryColor,
      labelStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
  ]);

  late CircularBottomNavigationController _navigationController;
  final LoginController _loginController = Get.put(LoginController());
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _loginController.userDetail();
    homeController.getAllCategory(context);
    homeController.getAllRestaurant(context);

    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(),
      body: bodyContainer(),
    );
  }

  Widget bodyContainer() {
    List<Widget> screens = [WishListScreen(), HomeScreen(), ProfileScreen()];
    Widget selectedScreen = screens[selectedPos];

    return selectedScreen;
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      barBackgroundColor: Colors.white,
      // barBackgroundGradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      //   colors: [
      //     Colors.blue,
      //     Colors.red,
      //   ],
      // ),
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          log(_navigationController.value.toString());
        });
      },
    );
  }
}
