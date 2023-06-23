import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prueba_tecnica_alejandro_vertel/components/my_datetextfield.dart';
import 'package:prueba_tecnica_alejandro_vertel/controllers/date_controller.dart';
import 'package:prueba_tecnica_alejandro_vertel/model/address_model.dart';
import 'package:prueba_tecnica_alejandro_vertel/pages/login_page.dart';
import '../components/my_button.dart';
import '../components/my_textfields.dart';
//GetX
import 'package:get/get.dart';
//Hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/user_model.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  //reference our DB
  final userBox = Hive.box('users');
  final addressBox = Hive.box('addresses');

  //Text Editing Controllers
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  //Date Controller
  DateController dateCtrl = Get.find();

  void writeData() {
    //We are going to write the user's data
    if (usernameCtrl.text != '') {
      //We add the user to the users box
      userBox.add(Users(
          username: usernameCtrl.text,
          name: nameCtrl.text,
          lastName: lastNameCtrl.text,
          birthDate: dateCtrl.birthDateCtrl.value.text,
          password: passwordCtrl.text));
      //We add the address to the addresses box, it relates to the users box by the user's username
      addressBox
          .add(Address(username: usernameCtrl.text, address: addressCtrl.text));
      Get.to(() => const LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          //We center the column
          child: Center(
            //Container for guidance (get rid of it later)
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey[300],
              //Column that will store all the things
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  //Logo
                  const Icon(
                    FontAwesomeIcons.userPlus,
                    size: 80,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //Welcome message
                  Text(
                    'Regístrate',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 35,
                  ),
                  //username
                  MyTextField(
                      controller: usernameCtrl,
                      obscureText: false,
                      icono: const Icon(FontAwesomeIcons.user),
                      name: 'Usuario'),
                  //Name
                  MyTextField(
                      controller: nameCtrl,
                      obscureText: false,
                      icono: const Icon(FontAwesomeIcons.pen),
                      name: 'Nombres'),
                  //Lastname
                  MyTextField(
                      controller: lastNameCtrl,
                      obscureText: false,
                      icono: const Icon(FontAwesomeIcons.penClip),
                      name: 'Apellidos'),
                  //Birthdate
                  MyDateTextField(
                      //Using GetX to handle the state and the text editing controller
                      controller: dateCtrl.birthDateCtrl,
                      obscureText: false,
                      icono: Icon(FontAwesomeIcons.calendar),
                      name: 'Fecha de Nacimiento'),
                  //Address
                  MyTextField(
                      controller: addressCtrl,
                      obscureText: false,
                      icono: const Icon(FontAwesomeIcons.addressCard),
                      name: 'Dirección'),
                  //password
                  MyTextField(
                      controller: passwordCtrl,
                      obscureText: true,
                      icono: const Icon(FontAwesomeIcons.lock),
                      name: 'Contraseña'),
                  const SizedBox(height: 25),
                  //sign in button
                  MyButton(
                    callback: writeData,
                    text: 'Registrarse',
                  ),
                  const SizedBox(height: 25),
                  //Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Divider(
                      thickness: 3,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //new user -> signup
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '¿Ya estás registrado?',
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          //It must take me to the sign up page
                          Get.to(() => LoginPage());
                          usernameCtrl.clear();
                          nameCtrl.clear();
                          lastNameCtrl.clear();
                          addressCtrl.clear();
                          passwordCtrl.clear();
                          dateCtrl.birthDateCtrl.clear();
                        },
                        child: Text(
                          'Inicia Sesión',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
