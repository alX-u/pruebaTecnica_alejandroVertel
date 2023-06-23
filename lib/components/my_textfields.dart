import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final bool obscureText;
  final icono;
  final String name;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.icono,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.grey[700]),
          obscureText: obscureText,
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
  }
}
