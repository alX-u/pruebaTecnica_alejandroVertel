import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  var selectedDate = DateTime.now().obs;
  final birthDateCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  void pickDate() async {
    DateTime? choosedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2070));
    if (choosedDate != null && choosedDate != selectedDate.value) {
      selectedDate.value = choosedDate;
      birthDateCtrl.text =
          DateFormat('dd-MM-yyyy').format(choosedDate).toString();
    }
  }
}
