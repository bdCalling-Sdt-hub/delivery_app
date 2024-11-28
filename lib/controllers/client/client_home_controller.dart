import 'package:get/get.dart';

class ClientHomeController extends GetxController {
  RxString selectedRequestType = ''.obs;

  // Dropdown items
  final List<String> requestTypes = ['Bucket', 'Bag', 'Box'];

  // Quantity field value
  RxString quantity = ''.obs;

  // Validate request action
  void validateRequest() {
    if (selectedRequestType.value.isEmpty || quantity.value.isEmpty) {
      Get.snackbar(
        "Validation Error",
        "Please fill all fields.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Perform validation logic
    print("Request Type: ${selectedRequestType.value}");
    print("Quantity: ${quantity.value}");
  }
}
