import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryHistoryController extends GetxController {
  final RxList<String> subtitles = List.generate(5, (index) => "12/04/2024").obs;

  Future<void> pickDate(int index) async {
    final DateTime? pickedDate = await Get.dialog(
      DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      ),
    );

    if (pickedDate != null) {
      subtitles[index] =
      "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
    }
  }
}
