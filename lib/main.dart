import 'package:flutter/material.dart';
import 'package:prueba_tecnica_alejandro_vertel/controllers/active_user_controller.dart';
import 'package:prueba_tecnica_alejandro_vertel/controllers/date_controller.dart';
import 'package:prueba_tecnica_alejandro_vertel/model/address_model.dart';
import 'package:prueba_tecnica_alejandro_vertel/model/user_model.dart';
import 'package:prueba_tecnica_alejandro_vertel/pages/login_page.dart';
//GetX
import 'package:get/get.dart';
//Hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //We initialize the db
  await Hive.initFlutter();
  //Adapter
  Hive.registerAdapter(UsersAdapter());
  Hive.registerAdapter(AddressAdapter());
  //We open the boxes
  var box = await Hive.openBox('users');
  var box2 = await Hive.openBox('addresses');
  //We call the controllers
  Get.put(DateController());
  Get.put(ActiveUserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Prueba Técnica - Alejandro Vertel',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
