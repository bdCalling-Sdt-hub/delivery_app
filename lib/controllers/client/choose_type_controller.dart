import 'package:get/get.dart';

class ScreenTypeController extends GetxController {
  RxBool isClientSelected = true.obs;

  void selectClient() {
    isClientSelected.value = true;
  }


  void selectDeliveryPerson() {
    isClientSelected.value = false;
  }
}