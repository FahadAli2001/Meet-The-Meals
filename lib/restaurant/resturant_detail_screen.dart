import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meethemeat/cart/cart_screen.dart';
import 'package:meethemeat/utils/utils.dart';

// ignore: must_be_immutable
class ResturantDetailScreen extends StatelessWidget {
  ResturantDetailScreen({super.key});

  var value = 'burger'.obs;

  handle(val) {
    value.value = val;
  }

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
                  Icon(
                    Icons.remove_circle,
                    color: primaryColor,
                    size: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '1',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Icon(
                    Icons.add_circle,
                    color: primaryColor,
                    size: 30,
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
                            Get.to(() => const CartScreen());
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/shotgun.png',
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
                        Text(
                          'Shot Gun Bag',
                          style: TextStyle(
                              fontSize: Get.width * 0.06,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$xx',
                          style: TextStyle(
                              fontSize: Get.width * 0.05,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    //
                    const Text(
                      'Delivery time 20 min',
                      style: TextStyle(
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
