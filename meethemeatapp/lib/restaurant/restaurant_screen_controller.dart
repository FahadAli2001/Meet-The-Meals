import 'package:get/get.dart';
import 'package:meethemeat/customs_widget/custom_snackbar.dart';

class RestaurantScreenController extends GetxController {
  var itemQuanitity = 1.obs;
  var totalValue = 0.obs;
  int platformFee = 5;
  var subTotal = 0.obs;

  
  void incQuantity() {
    itemQuanitity.value++;
  }

  void decQuantity(context) {
    if (itemQuanitity.value <= 1) {
      customWarningSnackbar(
          context, "Warning!!!!!!", "Item should not be less than 1");
    } else {
      itemQuanitity.value--;
    }
  }

  void calculateSubtotal(int productPrice) {
    subTotal.value = itemQuanitity.value * productPrice;
  }

  void calculateTotal(int delliveryFee, int productPrice) {
    totalValue.value =
        (productPrice * itemQuanitity.value) + delliveryFee + platformFee;
  }
}
