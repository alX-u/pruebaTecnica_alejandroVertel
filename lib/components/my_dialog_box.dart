import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:prueba_tecnica_alejandro_vertel/components/my_button.dart';
import 'package:prueba_tecnica_alejandro_vertel/components/my_textfields.dart';

import '../controllers/active_user_controller.dart';
import '../model/address_model.dart';

class MyDialogBox extends StatelessWidget {
  final getContext;

  MyDialogBox({super.key, required this.getContext});

  final newAddress = TextEditingController();

  final addressBox = Hive.box('addresses');

  ActiveUserController activeUserController = Get.find();

  void saveNewAddress() {
    //We add the address to the addresses box, it relates to the users box by the user's username
    addressBox.add(Address(
        username: activeUserController.getUsername, address: newAddress.text));
    activeUserController.addUserAddresses(Address(
        username: activeUserController.getUsername, address: newAddress.text));
    Navigator.pop(getContext);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 250,
        width: 300,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Ingrese una nueva dirección'),
            const SizedBox(
              height: 30,
            ),
            //get user address
            MyTextField(
              controller: newAddress,
              obscureText: false,
              icono: const Icon(FontAwesomeIcons.addressBook),
              name: '',
            ),
            //Buttons
            MyButton(text: 'Guardar', callback: saveNewAddress)
          ],
        ),
      ),
    );
  }
}
