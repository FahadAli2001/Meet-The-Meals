import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meethemeat/customs_widget/custom_snackbar.dart';
import 'package:meethemeat/utils/api.dart';

class HomeController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var allCategory;
  // ignore: prefer_typing_uninitialized_variables
  var allRestaurant;

  Future getAllCategory(context) async {
    try {
      var response = await http.get(Uri.parse(getCategoryApi));
      if (response.statusCode == 200) {
        allCategory = jsonDecode(response.body);
      } else {
        customErrorSnackbar(context, "Error!!", "Something went wrong");
      }
    } catch (e) {
      log(e.toString());
      customErrorSnackbar(context, "Error!!", "Something went wrong");
    }

    return allCategory;
  }

  Future getAllRestaurant(context) async {
    try {
      var response = await http.get(Uri.parse(getRestaurantApi));
      if (response.statusCode == 200) {
        allRestaurant = jsonDecode(response.body);
        // log(allRestaurant.toString());
      } else {
        customErrorSnackbar(context, "Error!!", "Something went wrong");
      }
    } catch (e) {
      log(e.toString());
      customErrorSnackbar(context, "Error!!", "Something went wrong");
    }
    return allRestaurant;
  }

  List filterData = [];
  void filterCategory(int cateIndex) {
    allRestaurant["restaurant"].forEach((menu) {
      if (menu['category'] == allCategory["categories"][cateIndex]['name']) {
        filterData.add(menu);
      }
    });
  }
}
