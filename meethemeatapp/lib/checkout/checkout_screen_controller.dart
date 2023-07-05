import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meethemeat/customs_widget/custom_snackbar.dart';
import 'package:meethemeat/login/login_controller.dart';
import 'package:meethemeat/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../restaurant/restaurant_screen_controller.dart';

class CheckOutScreenController extends GetxController {
  //
  LoginController loginController = Get.put(LoginController());
  //
  RestaurantScreenController restaurantScreenController =
      Get.put(RestaurantScreenController());

  //
  List orders = [];
  //order api
  Future placeOrder(context, String restaurantName, String orderName) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String userId = sp.getString('userId')!;
    try {
      final response = await http.post(Uri.parse(placeOrderApi),
          body: jsonEncode({
            "user_id": userId,
            "name": loginController.name.value,
            "address": "karachi",
            "contact_number": loginController.phoneNumber.value,
            "email": loginController.email.value,
            "total": restaurantScreenController.totalValue.value,
            "status": "pending",
            "restaurant_name": restaurantName,
            "order": [
              {
                "item_name": orderName,
                "quantity": restaurantScreenController.itemQuanitity.value,
              }
            ]
          }));

      if (response.statusCode == 200) {
        customSuccessSnackbar(context, "Congartz!!!", "Your Order is placed");
      } else {
        customErrorSnackbar(context, 'Error', 'Order Not Placed');
      }
    } catch (e) {
      customErrorSnackbar(context, 'Error', 'Something went wrong');
    }
  }
}
