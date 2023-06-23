// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_alejandro_vertel/controllers/date_controller.dart';

class MyDateTextField extends StatelessWidget {
  final controller;
  final bool obscureText;
  final icono;
  final String name;
  const MyDateTextField(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.icono,
      required this.name});

  @override
  Widget build(BuildContext context) {
    DateController dateCtrl = Get.find();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.grey[700]),
          obscureText: obscureText,
          readOnly: true,
          onTap: () {
            //Open Date Picker and update controller value
            dateCtrl.pickDate();
          },
          decoration: InputDecoration(
              prefixIcon: icono,
              prefixIconColor: Colors.grey[600],
              labelText: name,
              labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.3)),
              fillColor: Colors.white,
              filled: true),
        ));
    ;
  }
}
