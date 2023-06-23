import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ActiveUserController extends GetxController {
  final RxString usernameGet = ''.obs;
  final RxString nameGet = ''.obs;
  final RxString lastNameGet = ''.obs;
  final RxString birthDateGet = ''.obs;
  final RxString addressGet = ''.obs;

  String get getUsername => usernameGet.value;
  String get getName => nameGet.value;
  String get getLastName => lastNameGet.value;
  String get getBirthDate => birthDateGet.value;
  String get getAddress => addressGet.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  void signInUser(
      String username, String name, String lastName, String birthDate) {
    usernameGet.value = username;
    nameGet.value = name;
    lastNameGet.value = lastName;
    birthDateGet.value = birthDate;
  }
}
