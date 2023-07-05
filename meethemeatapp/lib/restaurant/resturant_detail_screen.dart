import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/cart/cart_screen.dart';
import 'package:meethemeat/checkout/checkout_screen_controller.dart';
import 'package:meethemeat/restaurant/restaurant_screen_controller.dart';
import 'package:meethemeat/utils/utils.dart';

// ignore: must_be_immutable
class ResturantDetailScreen extends StatelessWidget {
  ResturantDetailScreen({super.key});

  var value = 'burger'.obs;

  handle(val) {
    value.value = val;
  }

  final RestaurantScreenController restaurantScreenController =
      Get.put(RestaurantScreenController());

  CheckOutScreenController checkOutScreenController =
      Get.put(CheckOutScreenController());
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          width: Get.width,
          height: Get.height * 0.1,
          child: Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      restaurantScreenController.decQuantity(context);
                    },
                    child: Icon(
                      Icons.remove_circle,
                      color: primaryColor,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Obx(
                      () => Text(
                        restaurantScreenController.itemQuanitity.value
                            .toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      restaurantScreenController.incQuantity();
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: primaryColor,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: SizedBox(
                      width: Get.width * 0.6,
                      child: CupertinoButton(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor,
                          child: const Text("Add to cart"),
                          onPressed: () {
                            restaurantScreenController.calculateTotal(
                                data['restaurant']['dcharges'],
                                data['restaurant_detail']['pprice']);
                            //
                            restaurantScreenController.calculateSubtotal(
                                data['restaurant_detail']['pprice']);
                            //
                            var order = {
                              "res_name": data['restaurant']['name'],
                              "item_name": data['restaurant_detail']['pname'],
                              "price": data['restaurant_detail']['pprice'],
                              "qnty":
                                  restaurantScreenController.itemQuanitity.value
                            };

                            checkOutScreenController.orders.add(order);

                            log((checkOutScreenController.orders
                                .toString()));
                            // Get.to(() => CartScreen(), arguments: {
                            //   "restaurant_detail": data['restaurant_detail'],
                            //   "restaurant": data['restaurant']
                            // });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined),
                color: Colors.black,
              ),
            )
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        data['restaurant_detail']['pimage'].toString(),
                      ),
                      fit: BoxFit.fill)),
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.1,
              color: primaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            data['restaurant_detail']['pname'],
                            style: TextStyle(
                                fontSize: Get.width * 0.06,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "\$ ${data['restaurant_detail']['pprice']}",
                          style: TextStyle(
                              fontSize: Get.width * 0.05,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    //
                    Text(
                      'Delivery time ${data["restaurant"]["dtime"]} min',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Burger',
                style: TextStyle(
                    fontSize: Get.width * 0.05,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Obx(
              () => RadioListTile(
                value: 'Southern Zing Burger',
                groupValue: value.value,
                onChanged: (val) {
                  value.value = val!;
                },
                title: const Text('Southern Zing Burger '),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Fries',
                style: TextStyle(
                    fontSize: Get.width * 0.05,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'select any one',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            //
            Obx(
              () => RadioListTile(
                value: 'BBQ fries',
                groupValue: value.value,
                onChanged: (val) {
                  value.value = val!;
                },
                title: const Text('BBQ Fries'),
              ),
            ),
            //
            Obx(
              () => RadioListTile(
                value: 'Cheddar cheese fries',
                groupValue: value.value,
                onChanged: (val) {
                  value.value = val!;
                },
                title: const Text('Cheddar cheese fries'),
              ),
            ),
            //
            Obx(
              () => RadioListTile(
                value: 'Garlic Mayo Fries',
                groupValue: value.value,
                onChanged: (val) {
                  value.value = val!;
                },
                title: const Text('Garlic Mayo Fries'),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Drink',
                style: TextStyle(
                    fontSize: Get.width * 0.05,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'select any one',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            //
            Obx(
              () => RadioListTile(
                value: 'Marinda',
                groupValue: value.value,
                onChanged: (val) {
                  value.value = val!;
                },
                title: const Text('Marinda'),
              ),
            ),
            //
            Obx(
              () => RadioListTile(
                value: 'Pepsi',
                groupValue: value.value,
                onChanged: (val) {
                  value.value = val!;
                },
                title: const Text('Pepsi'),
              ),
            ),
            //
            Obx(
              () => RadioListTile(
                value: '7up',
                groupValue: value.value,
                onChanged: (val) {
                  value.value = val!;
                },
                title: const Text('7up'),
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Special Instruction',
                style: TextStyle(
                    fontSize: Get.width * 0.05,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'give some instruction to restaurant',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            //

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'eg : extra sauce', border: OutlineInputBorder()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
